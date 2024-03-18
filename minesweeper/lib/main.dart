import 'package:flutter/material.dart';
import 'package:maze_game/screens/minesweeper.dart';
import 'package:maze_game/screens/start_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StartScreen(),
    );
  }
}
