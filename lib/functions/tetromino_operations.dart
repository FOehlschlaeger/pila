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
T rotate<T extends Tetromino>(T tetromino) {
  Tetromino emptyTetromino = Tetromino();
  List<List<int>> rotatedGrid = List.from(emptyTetromino);

  for (int i = 0; i < tetromino.length; i++) {
    for (int j = 0; j < tetromino[i].length; j++) {
      rotatedGrid[j][tetromino.length - i - 1] = tetromino[i][j];
    }
  }

  return tetromino.copyWith(rotatedGrid) as T;
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
T shiftUp<T extends Tetromino>(T tetromino) {
  if (hasEmptyRowAtIndex(tetromino, 0)) {
    List<List<int>> shiftedGrid = List.from(tetromino);

    List<int> firstRow = shiftedGrid.removeAt(0);
    shiftedGrid.add(firstRow);

    return tetromino.copyWith(shiftedGrid) as T;
  }

  return tetromino;
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
T shiftDown<T extends Tetromino>(T tetromino) {
  if (hasEmptyRowAtIndex(tetromino, tetromino.length - 1)) {
    List<List<int>> shiftedGrid = List.from(tetromino);

    List<int> lastRow = shiftedGrid.removeAt(tetromino.length - 1);
    shiftedGrid.insert(0, lastRow);

    return tetromino.copyWith(shiftedGrid) as T;
  }

  return tetromino;
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
T shiftLeft<T extends Tetromino>(T tetromino) {
  if (hasEmptyColumnAtIndex(tetromino, 0)) {
    List<List<int>> shiftedGrid = List.from(tetromino);

    for (int i = 0; i < shiftedGrid.length; i++) {
      shiftedGrid[i].removeAt(0);
      shiftedGrid[i].add(0);
    }

    return tetromino.copyWith(shiftedGrid) as T;
  }

  return tetromino;
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
T shiftRight<T extends Tetromino>(T tetromino) {
  if (hasEmptyColumnAtIndex(tetromino, tetromino.length - 1)) {
    List<List<int>> shiftedGrid = List.from(tetromino);

    for (int i = 0; i < shiftedGrid.length; i++) {
      shiftedGrid[i].removeLast();
      shiftedGrid[i].insert(0, 0);
    }

    return tetromino.copyWith(shiftedGrid) as T;
  }

  return tetromino;
}
