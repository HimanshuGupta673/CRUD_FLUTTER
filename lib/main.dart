import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todolist/screens/home.dart';

void main() {
  // SystemChrome.setSystemUIOverlayStyle(
  //   SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  // );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: Home(),
    );
  }
}

