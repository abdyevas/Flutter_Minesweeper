import 'dart:math';

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

        for (int k = -1; k <= 1; k++) {
          for (int m = -1; m <= 1; m++) {
            int neighborRow = i + k;
            int neighborCol = j + m;

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
