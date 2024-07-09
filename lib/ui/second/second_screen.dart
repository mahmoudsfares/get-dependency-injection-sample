import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_di_sample/model/model.dart';
import 'second_controller.dart';

class SecondScreen extends GetView<SecondController> {

  @override
  Widget build(BuildContext context) {
    controller.fetchData();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() {
              FetchState state = controller.state.value;
              if (controller.state.value is Loading) {
                return const CircularProgressIndicator();
              } else if (controller.state.value is Error) {
                String error = (state as Error).error.toString();
                return Text(error);
              } else if (controller.state.value is Fetched) {
                String data = ((controller.state.value as Fetched).data as Model).title;
                return Text(data);
              } else {
                return const SizedBox();
              }
            }),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: controller.getTextInPrefs,
                child: const Text('Click to see text in preferences')),
            const SizedBox(height: 8),
            Obx(() {
              String textInPrefs = controller.textInPrefs;
              if (textInPrefs.isEmpty) {
                return const SizedBox();
              } else {
                return Text('Text in preferences is: $textInPrefs');
              }
            }),
          ],
        ),
      ),
    );
  }
}
