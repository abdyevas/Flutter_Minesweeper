import 'package:flutter/material.dart';
import 'dart:math';

class Minesweeper extends StatefulWidget {
  const Minesweeper({super.key});

  @override
  State<Minesweeper> createState() => _MinesweeperState();
}

class _MinesweeperState extends State<Minesweeper> {
  List<List<bool>> board = [];
  int numMines = 20;
  
  @override
  void initState() {
    super.initState();
    initializeBoard();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minesweeper Game'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            board.length,
            (rowIndex) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  board[rowIndex].length,
                  (colIndex) {
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          border: Border.all(color: const Color.fromARGB(255, 54, 54, 54)),
                          color: board[rowIndex][colIndex]
                              ? Colors.grey 
                              : Colors.white, 
                        ),
                      ),
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

  void initializeBoard() {
    for (int i = 0; i < 10; i++) {
      board.add(List.generate(10, (j) => true));
    }
  }

  void placeMines() {
    int minesPlaced = 0;
    Random random = Random();

    while(minesPlaced < numMines) {

    }
  }
}
