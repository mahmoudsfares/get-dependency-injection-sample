import 'package:flutter/material.dart';
import 'package:get_di_sample/ui/second/second_screen.dart';
import 'package:get_di_sample/di/injection_container.dart' as di;
import 'ui/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (_) => const HomeScreen(),
        '/second': (_) => const SecondScreen()
      },
    );
  }
}