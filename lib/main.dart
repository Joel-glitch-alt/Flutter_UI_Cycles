import 'package:flutter/material.dart';
import 'package:my_calculator/screen_2/loan_2.dart';
//import 'package:my_calculator/screens/firstScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculatorr',
      debugShowCheckedModeBanner: false,
      home: const Loan(),

      //
      // HomePage(),
    );
  }
}
