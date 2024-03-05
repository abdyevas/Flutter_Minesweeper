import 'package:flutter/material.dart';
import 'package:maze_game/screens/minesweeper.dart';
import 'package:maze_game/screens/start_screen.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Game();
  }
}

class _Game extends State<Game> {
  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen: startGame);
    super.initState();
  }

  void startGame(bool isOnePlayer) {
    setState(() {
      activeScreen = const Minesweeper();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: activeScreen,
      ),
    );
  }
}
