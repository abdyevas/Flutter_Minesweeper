import 'package:flutter/material.dart';
import 'dart:math';

import 'package:maze_game/widgets/create_board.dart';

class Minesweeper extends StatefulWidget {
  const Minesweeper({super.key});

  @override
  State<Minesweeper> createState() => _MinesweeperState();
}

class _MinesweeperState extends State<Minesweeper> {
  List<List<int>> board = [];
  List<List<bool>> revealed = [];
  int numMines = 10;

  @override
  void initState() {
    super.initState();
    initializeBoard();
    placeMines(board, numMines, 8, 8);
    calculateNeighbors(board, 8, 8);
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
                              ? board[rowIndex][colIndex] == -1
                                  ? Colors.red
                                  : const Color.fromARGB(255, 8, 29, 58)
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

  void revealCell(int rowIndex, int colIndex) {
    setState(() {
      revealed[rowIndex][colIndex] = true;
    });
  }
}

List<List<int>> initializeBoard() {
  List<List<int>> board = [];

  for (int i = 0; i < 8; i++) {
    board.add(List.generate(8, (j) => 0));
  }

  return board;
}

void placeMines(List<List<int>> board, int numMines, int x, int y) {
  int minesPlaced = 0;
  Random random = Random();

  while (minesPlaced < numMines) {
    int i = random.nextInt(x);
    int j = random.nextInt(y);

    if (board[i][j] == 0) {
      board[i][j] = -1;
      minesPlaced++;
    }
  }
}

void calculateNeighbors(List<List<int>> board, int x, int y) {
  for (int i = 0; i < x; i++) {
    for (int j = 0; j < y; j++) {
      if (board[i][j] == 0) {
        int minesCount = 0;

        for (int x = -1; x <= 1; x++) {
          for (int y = -1; y <= 1; y++) {
            int neighborRow = i + x;
            int neighborCol = j + y;

            if (neighborRow >= 0 &&
                neighborRow < x &&
                neighborCol >= 0 &&
                neighborCol < y &&
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
