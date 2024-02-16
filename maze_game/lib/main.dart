import 'package:flutter/material.dart';
import 'package:maze_game/maze_game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MazeGame();
  }
}
