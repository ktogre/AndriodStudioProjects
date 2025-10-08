import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF0A0E21)),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0A0E21),
          centerTitle: true,
          foregroundColor: Colors.white,
        ),
      ),
      // textTheme: TextTheme(bodyMedium: TextStyle(color: Colors.white)),
      // colorScheme: ColorScheme.light(
      //   primary: Colors.green,
      //   secondary: Colors.blue,
      home: InputPage(),
    );
  }
}
