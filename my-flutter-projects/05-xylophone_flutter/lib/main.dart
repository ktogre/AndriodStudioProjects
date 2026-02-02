import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  XylophoneApp({super.key});

  final player = AudioPlayer();

  Future<void> playSound(int soundNumber) async {
    try {
      await player.setAudioSource(
        AudioSource.asset('assets/note$soundNumber.wav'),
      );
      player.play();
    } catch (e) {
      debugPrint("Error: $e");
    }
  }

  Widget soundKeys({required Color color, required int soundNumber}) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: color,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero, // <- makes it a box
          ),
        ),
        onPressed: () {
          playSound(soundNumber);
        },
        child: const SizedBox.shrink(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              soundKeys(color: Colors.red, soundNumber: 1),
              soundKeys(color: Colors.blue, soundNumber: 2),
              soundKeys(color: Colors.green, soundNumber: 3),
              soundKeys(color: Colors.teal, soundNumber: 4),
              soundKeys(color: Colors.orangeAccent, soundNumber: 5),
              soundKeys(color: Colors.yellow, soundNumber: 6),
              soundKeys(color: Colors.indigo, soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}
