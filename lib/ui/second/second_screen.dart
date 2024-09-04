import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_di_sample/model/model.dart';
import 'second_controller.dart';

class SecondScreen extends StatefulWidget {

  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late final SecondController controller;
  final String key = UniqueKey().toString();

  @override
  void initState() {
    super.initState();
    controller = Get.put(SecondController(), tag: key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<SecondController>(
                tag: key,
                builder: (controller){
              if (controller.state is Loading) {
                return const CircularProgressIndicator();
              } else if (controller.state is Error) {
                String error = (controller.state as Error).error.toString();
                return Text(error);
              } else if (controller.state is Fetched) {
                String data = ((controller.state as Fetched).data as Model).title;
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
            GetBuilder<SecondController>(
                tag: key,
                builder: (controller) {
              String textInPrefs = controller.textInPrefs;
              if (textInPrefs.isEmpty) {
                return const SizedBox();
              } else {
                return Text('Text in preferences is: $textInPrefs');
              }
            }),
            ElevatedButton(
                onPressed: () => Navigator.pushNamed(context, '/second'),
                child: const Text('Create new screen')),
          ],
        ),
      ),
    );
  }
}
