import 'package:flutter/material.dart';
import 'package:my_calculator/screen_3/content.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculatorr',
      debugShowCheckedModeBanner: false,
      home: ParcelTracker(),
      //Body()
      //Loan()
    );
  }
}
