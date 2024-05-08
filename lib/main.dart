import 'package:App/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:App/pages/basketball.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/basketball':(context) => Basketball(),

      },
    );
  }
}
