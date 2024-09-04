import 'package:flutter/material.dart';
import 'package:get_di_sample/di/injection_container.dart';
import 'package:get_di_sample/model/model.dart';
import 'package:get_di_sample/ui/second/second_controller.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  final SecondController controller = serviceLocator<SecondController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    controller.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ValueListenableBuilder(
              valueListenable: controller.state,
              builder: (context, state, child) {
                if (state is Loading) {
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
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(onPressed: controller.getTextInPrefs, child: const Text('Click to see text in preferences')),
            const SizedBox(height: 8),
            ValueListenableBuilder(
              valueListenable: controller.textInPrefs,
              builder: (context, textInPrefs, child) {
                if (textInPrefs.isEmpty) {
                  return const SizedBox();
                } else {
                  return Text('Text in preferences is: $textInPrefs');
                }
              },
            ),
            ElevatedButton(onPressed: () => Navigator.pushNamed(context, '/second'), child: const Text('Open new screen')),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
