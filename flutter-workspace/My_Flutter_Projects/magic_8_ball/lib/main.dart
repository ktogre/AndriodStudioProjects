import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MaterialApp(home: BallPage()));
}

// Stateless Widget
class BallPage extends StatelessWidget {
  const BallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        title: Text("Ask Me Anything"),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Colors.indigo[700],
      ),
      body: Ball(),
    );
  }
}

// Stateful Widget
class Ball extends StatefulWidget {
  const Ball({super.key});

  @override
  State<Ball> createState() => _BallState();
}

class _BallState extends State<Ball> {
  int magicBallAnswers = 1;

  void changeMagicBallAnswers() {
    setState(() {
      magicBallAnswers = Random().nextInt(5) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextButton(
              onPressed: () {
                changeMagicBallAnswers();
              },
              child: Image.asset('images/ball$magicBallAnswers.png'),
            ),
          ),
        ],
      ),
    );
  }
}
