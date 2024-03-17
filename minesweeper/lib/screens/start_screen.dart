import 'package:flutter/material.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key, required this.switchScreen});

  final void Function(bool isOnePlayer) switchScreen;

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 20,
          ),
          const Text('Welcome to Minesweeper'),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Easy'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Standart'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Expert'),
          ),
        ],
      ),
    );
  }
}
