import 'package:flutter/material.dart';
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
    initializeBoards();
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
                              ? board[rowIndex][colIndex] != 0
                                  ? Text(
                                      board[rowIndex][colIndex].toString(),
                                      style: const TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  : const Text('')
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

  void initializeBoards() {
    for (int i = 0; i < 8; i++) {
      board.add(List.generate(8, (i) => 0));
      revealed.add(List.generate(8, (i) => false));
    }
  }

  void revealCell(int rowIndex, int colIndex) {
    if (board[rowIndex][colIndex] == -1) {
      setState(() {
        revealed[rowIndex][colIndex] = true;
      });
    } else {
      revealNeighbors(rowIndex, colIndex);
    }
  }

  void revealNeighbors(int rowIndex, int colIndex) {
    if (rowIndex < 0 ||
        rowIndex >= 8 ||
        colIndex < 0 ||
        colIndex >= 8 ||
        revealed[rowIndex][colIndex]) {
      return;
    }
    setState(() {
      revealed[rowIndex][colIndex] = true;
    });
    if (board[rowIndex][colIndex] != 0) {
      return;
    }

    for (int i = -1; i <= 1; i++) {
      for (int j = -1; j <= 1; j++) {
        if (i != 0 || j != 0) {
          revealNeighbors(rowIndex + i, colIndex + j);
        }
      }
    }
  }
}
