
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('click to fetch text and view text in prefs'),
          onPressed: () => Navigator.pushNamed(context, '/second'),
        ),
      ),
    );
  }
}
