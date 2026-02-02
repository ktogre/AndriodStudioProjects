import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFB2CCEB),
        appBar: AppBar(
          title: Text("Brain App"),
          centerTitle: true,
          backgroundColor: Color(0xFF1E98B3),
          foregroundColor: Colors.white,
        ),
        body: Center(child: Image(image: AssetImage('images/brain.png'))),
      ),
    ),
  );
}
