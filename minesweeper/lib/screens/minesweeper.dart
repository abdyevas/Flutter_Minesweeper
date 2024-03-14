import 'package:flutter/material.dart';
import 'dart:math';

class Minesweeper extends StatefulWidget {
  const Minesweeper({super.key});

  @override
  State<Minesweeper> createState() => _MinesweeperState();
}

class _MinesweeperState extends State<Minesweeper> {
  List<List<int>> board = [];
  List<List<bool>> revealed = [];
  int numMines = 20;

  @override
  void initState() {
    super.initState();
    initializeBoard();
    placeMines();
    calculateNeighbors();
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
                      onTap: () {
                        revealCell(rowIndex, colIndex);
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: const Color.fromARGB(255, 54, 54, 54)),
                          color: revealed[rowIndex][colIndex]
                              ? const Color.fromARGB(255, 8, 29, 58)
                              : const Color.fromARGB(255, 78, 110, 167),
                        ),
                        child: Center(
                          child: board[rowIndex][colIndex] > -1
                          ? Text(
                            board[rowIndex][colIndex].toString(),
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )
                          : Image.asset(
                            'assets/images/mine_icon.png',
                            width: 20,
                            height: 20,
                          ),
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
      board.add(List.generate(10, (j) => 0));
      revealed.add(List.generate(10, (j) => false));
    }
  }

  void placeMines() {
    int minesPlaced = 0;
    Random random = Random();

    while (minesPlaced < numMines) {
      int i = random.nextInt(10);
      int j = random.nextInt(10);

      if (board[i][j] == 0) {
        board[i][j] = -1;
        minesPlaced++;
      }
    }
  }

  void calculateNeighbors() {
    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        if (board[i][j] == 0) {
          int minesCount = 0;

          for (int x = -1; x <= 1; x++) {
            for (int y = -1; y <= 1; y++) {
              int neighborRow = i + x;
              int neighborCol = j + y;

              if (neighborRow >= 0 &&
                  neighborRow < 10 &&
                  neighborCol >= 0 &&
                  neighborCol < 10 &&
                  board[neighborRow][neighborCol] == -1) {
                minesCount++;
              }
            }
          }
          board[i][j] = minesCount;
        }
      }
    }
  }

  void revealCell(int rowIndex, int colIndex) {
    setState(() {
      revealed[rowIndex][colIndex] = true;      
    });
  }
}
