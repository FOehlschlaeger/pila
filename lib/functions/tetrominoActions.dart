import 'package:pila/functions/helperFunctions.dart';

/*
Rotate tetromino to the right.
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
List<List<int>> rotate(List<List<int>> tetromino) {
  final rotatedTetromino = List.generate(
      tetromino[0].length, (_) => List.filled(tetromino.length, 0));

  for (int i = 0; i < tetromino.length; i++) {
    for (int j = 0; j < tetromino[i].length; j++) {
      rotatedTetromino[j][tetromino.length - i - 1] = tetromino[i][j];
    }
  }

  return rotatedTetromino;
}

/*
Shift up operation by one position.
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
List<List<int>> shiftUp(List<List<int>> tetromino) {
  final List<List<int>> shiftedTetromino = List<List<int>>.from(tetromino);

  if (hasEmptyRowAtIndex(tetromino, 0)) {
    // shift all entries up by one position
    shiftedTetromino.add(tetromino.first);
    shiftedTetromino.remove(tetromino.first);
    return shiftedTetromino;
  } else {
    // nothing should happen to tetromino if not shiftable
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
List<List<int>> shiftDown(List<List<int>> tetromino) {
  final List<List<int>> shiftedTetromino = List<List<int>>.from(tetromino);
  if (hasEmptyRowAtIndex(tetromino, tetromino.length - 1)) {
    // shift all entries down by one position
    shiftedTetromino.insert(0, tetromino.last);
    shiftedTetromino.removeLast();
    return shiftedTetromino;
  } else {
    // nothing should happen to tetromino if not shiftable
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
List<List<int>> shiftLeft(List<List<int>> tetromino) {
  final List<List<int>> shiftedTetromino = List<List<int>>.from(tetromino);
  int columns = tetromino.length;
  if (hasEmptyColumnAtIndex(tetromino, 0)) {
    // shift all entries to the left by one position
    for (int i = 0; i < columns; i++) {
      shiftedTetromino[i].add(0);
      shiftedTetromino[i].removeAt(0);
    }
    return shiftedTetromino;
  } else {
    // nothing should happen to tetromino if not shiftable
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
List<List<int>> shiftRight(List<List<int>> tetromino) {
  final List<List<int>> shiftedTetromino = List<List<int>>.from(tetromino);
  int columns = tetromino.length;
  if (hasEmptyColumnAtIndex(tetromino, columns - 1)) {
    // shift all entries to the right by one position
    for (int i = 0; i < columns; i++) {
      shiftedTetromino[i].insert(0, 0);
      shiftedTetromino[i].removeLast();
    }
    return shiftedTetromino;
  } else {
    // nothing should happen to tetromino if not shiftable
    return tetromino;
  }
}
