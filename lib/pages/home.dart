import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Color.fromARGB(232, 232, 232, 232),
      body: SafeArea(
        child: Text('Hello'),
      ),
    );
  }
}