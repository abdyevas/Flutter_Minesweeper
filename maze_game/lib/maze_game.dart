import 'package:flutter/material.dart';

class MazeGame extends StatefulWidget {
  const MazeGame({super.key});

  @override
  State<MazeGame> createState() => _MazeGameState();
}

class _MazeGameState extends State<MazeGame> {
  List<List<bool>> maze = [
    [true, true, true, true, true, false, true],
    [true, true, true, true, true, false, true],
    [true, false, false, false, true, false, true],
    [true, false, true, false, false, false, true],
    [true, false, false, true, true, true, true],
    [true, true, false, true, true, true, true],
    [true, true, false, true, true, true, true],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maze Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            maze.length,
            (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  maze[rowIndex].length,
                  (colIndex) {
                    return Container(
                      width: 50,
                      height: 50,
                      color:
                          maze[rowIndex][colIndex] ? Colors.blue : Colors.black,
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
