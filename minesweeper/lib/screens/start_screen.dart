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
    return const Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 20,
          ),
          Text('Welcome to Minesweeper'),
          SizedBox(
            height: 30,
          ),
        // choose level 
        ],
      ),
    );
  }
}