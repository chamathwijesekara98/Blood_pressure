// lib/main.dart

//connect screen file to main dart file
import 'package:blood_pressure/screens.dart';

//import neccesary packges and libraris and setup dependencies
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Blood Pressure Classifier',
      theme: ThemeData(
          primarySwatch: Colors.blue, backgroundColor: Colors.white60),
      home: InputScreen(),
    );
  }
}
