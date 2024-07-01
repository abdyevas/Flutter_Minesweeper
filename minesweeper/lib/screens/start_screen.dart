import 'package:flutter/material.dart';
import 'package:maze_game/screens/minesweeper.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key}); 
  
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
          const Text(
            'Minesweeper',
            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Minesweeper(),
                ),
              );
            },
            child: const Text('Easy'), // 8 x 8 - 10
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Minesweeper(),
                ),
              );
            },
            child: const Text('Standart'), // 16 x 16 - 40
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Minesweeper(),
                ),
              );
            },
            child: const Text('Expert'), // 16 x 30 - 99
          ),
        ],
      ),
    );
  }
}
