import 'package:pila/functions/helper_functions.dart';
import 'package:pila/models/tetromino.dart';

/*
Rotate tetromino clockwise to the right.
Example:
[
  [0, 0, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
]
becomes
[
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 1, 1, 1],
  [0, 0, 0, 0]
]
 */
Tetromino rotate(Tetromino tetromino) {
  Tetromino rotatedTetromino = Tetromino();

  for (int i = 0; i < tetromino.length; i++) {
    for (int j = 0; j < tetromino[i].length; j++) {
      rotatedTetromino[j][tetromino.length - i - 1] = tetromino[i][j];
    }
  }

  return rotatedTetromino;
}

/*
Shift up operation by one position if first row only contains zeros.
Example:
[
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 1, 0]
]
becomes
[
  [0, 0, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
]
 */
Tetromino shiftUp(Tetromino tetromino) {
  // copy tetromino as list to handle the rows
  List<List<int>> shiftedTetromino = [];
  for (int row = 0; row < tetromino.length; row++) {
    shiftedTetromino.add(tetromino[row]);
  }

  // check if tetromino is shiftable
  if (hasEmptyRowAtIndex(tetromino, 0)) {
    // shift all entries up by one position
    shiftedTetromino.insert(tetromino.length - 1, tetromino.first);
    shiftedTetromino.remove(tetromino.first);
    return Tetromino.fromExistingGrid(shiftedTetromino);
  } else {
    return tetromino;
  }
}

/*
Shift down operation by one position.
Example:
[
  [0, 0, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
]
becomes
[
  [0, 0, 0, 0],
  [0, 0, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 1, 0]
]
 */
Tetromino shiftDown(Tetromino tetromino) {
  // Tetromino shiftedTetromino = Tetromino();
  // copy tetromino as list to handle the rows
  List<List<int>> shiftedTetromino = [];
  for (int row = 0; row < tetromino.length; row++) {
    shiftedTetromino.add(tetromino[row]);
  }

  if (hasEmptyRowAtIndex(tetromino, tetromino.length - 1)) {
    // shift all entries down by one position
    shiftedTetromino.insert(0, tetromino.last);
    shiftedTetromino.removeLast();
    return Tetromino.fromExistingGrid(shiftedTetromino);
  } else {
    return tetromino;
  }
}

/*
Shift left operation by one position.
Example:
[
  [0, 0, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
]
becomes
[
  [0, 1, 0, 0],
  [1, 1, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
]
 */
Tetromino shiftLeft(Tetromino tetromino) {
  // Tetromino shiftedTetromino = Tetromino();
  // copy tetromino as list to handle the rows
  List<List<int>> shiftedTetromino = [];
  for (int row = 0; row < tetromino.length; row++) {
    shiftedTetromino.add(tetromino[row]);
  }

  int columns = tetromino[0].length;
  if (hasEmptyColumnAtIndex(tetromino, 0)) {
    // shift all entries to the left by one position
    for (int i = 0; i < columns; i++) {
      shiftedTetromino[i].add(0);
      shiftedTetromino[i].removeAt(0);
    }
    return Tetromino.fromExistingGrid(shiftedTetromino);
  } else {
    return tetromino;
  }
}

/*
shift right operation by one position.
Example:
[
  [0, 0, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 1, 0],
  [0, 0, 0, 0]
]
becomes
[
  [0, 0, 0, 1],
  [0, 0, 1, 1],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
]
 */
Tetromino shiftRight(Tetromino tetromino) {
  // Tetromino shiftedTetromino = Tetromino();
  // copy tetromino as list to handle the rows
  List<List<int>> shiftedTetromino = [];
  for (int row = 0; row < tetromino.length; row++) {
    shiftedTetromino.add(tetromino[row]);
  }

  int columns = tetromino[0].length;
  if (hasEmptyColumnAtIndex(tetromino, columns - 1)) {
    // shift all entries to the right by one position
    for (int i = 0; i < columns; i++) {
      shiftedTetromino[i].insert(0, 0);
      shiftedTetromino[i].removeLast();
    }
    return Tetromino.fromExistingGrid(shiftedTetromino);
  } else {
    return tetromino;
  }
}
