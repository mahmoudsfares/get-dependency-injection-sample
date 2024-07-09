import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_di_sample/ui/home/home_binding.dart';
import 'package:get_di_sample/ui/second/second_controller.dart';
import 'package:get_di_sample/ui/second/second_screen.dart';
import 'package:get_di_sample/ui/second/second_service.dart';
import 'ui/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const HomeScreen(),
          // way #1: define dependencies binding in a separate class
          binding: HomeBinding()
        ),
        GetPage(
          name: '/second',
          page: () => SecondScreen(),
          // way #2: define dependencies building directly in a widget. both ways are fine.
          binding: BindingsBuilder(() {
            // those will be destroyed if back is pressed in the second screen.
            Get.lazyPut<SecondController>(() => SecondController());
            Get.lazyPut<SecondService>(() => SecondService());
          }),
        ),
      ],
    );
  }
}
