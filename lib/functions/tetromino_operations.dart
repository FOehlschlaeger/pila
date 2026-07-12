import 'package:pila/functions/grid_operations.dart';
import 'package:pila/functions/helper_functions.dart';
import 'package:pila/models/tetromino.dart';
import 'package:pila/utils/logger.dart';

/// Here are methods defined which apply or transform Tetromino objects

/// [rotate]
///
/// Rotate tetromino clockwise to the right.
///
/// Example:
/// ```dart
/// [
///   [0, 0, 1, 0],
///   [0, 1, 1, 0],
///   [0, 0, 1, 0],
///   [0, 0, 0, 0],
/// ]
/// becomes
/// [
///   [0, 0, 0, 0],
///   [0, 0, 1, 0],
///   [0, 1, 1, 1],
///   [0, 0, 0, 0],
/// ]
/// ```
T rotate<T extends Tetromino>(T tetromino) {
  if (!GridOperations.tetrominoEmpty(tetromino)) {
    Tetromino emptyTetromino = Tetromino();
    List<List<int>> rotatedGrid = List.from(emptyTetromino);

    for (int i = 0; i < tetromino.length; i++) {
      for (int j = 0; j < tetromino[i].length; j++) {
        rotatedGrid[j][tetromino.length - i - 1] = tetromino[i][j];
      }
    }

    log("[rotate] Operation successfull.");
    return tetromino.copyWith(rotatedGrid) as T;
  } else {
    return tetromino;
  }
}

/// [shiftUp]
///
/// Shift up operation by one position if first row only contains zeros.
///
/// Example:
/// ```dart
/// [
///   [0, 0, 0, 0],
///   [0, 0, 1, 0],
///   [0, 1, 1, 0],
///   [0, 0, 1, 0],
/// ]
/// becomes
/// [
///   [0, 0, 1, 0],
///   [0, 1, 1, 0],
///   [0, 0, 1, 0],
///   [0, 0, 0, 0],
/// ]
/// ```
T shiftUp<T extends Tetromino>(T tetromino) {
  if (!GridOperations.tetrominoEmpty(tetromino) &&
      hasEmptyRowAtIndex(tetromino, 0)) {
    List<List<int>> shiftedGrid = List.from(tetromino);

    List<int> firstRow = shiftedGrid.removeAt(0);
    shiftedGrid.add(firstRow);

    log("[shiftUp] Operation successfull.");
    return tetromino.copyWith(shiftedGrid) as T;
  }

  return tetromino;
}

/// [shiftDown]
///
/// Shift down operation by one position if last row only contains zeros.
///
/// Example:
/// ```dart
/// [
///   [0, 0, 1, 0],
///   [0, 1, 1, 0],
///   [0, 0, 1, 0],
///   [0, 0, 0, 0],
/// ]
/// becomes
/// [
///   [0, 0, 0, 0],
///   [0, 0, 1, 0],
///   [0, 1, 1, 0],
///   [0, 0, 1, 0],
/// ]
/// ```
T shiftDown<T extends Tetromino>(T tetromino) {
  if (!GridOperations.tetrominoEmpty(tetromino) &&
      hasEmptyRowAtIndex(tetromino, tetromino.length - 1)) {
    List<List<int>> shiftedGrid = List.from(tetromino);

    List<int> lastRow = shiftedGrid.removeAt(tetromino.length - 1);
    shiftedGrid.insert(0, lastRow);

    log("[shiftDown] Operation successfull.");
    return tetromino.copyWith(shiftedGrid) as T;
  }

  return tetromino;
}

/// [shiftLeft]
///
/// Shift left operation by one position.
///
/// Example:
/// ```dart
/// [
///   [0, 0, 1, 0],
///   [0, 1, 1, 0],
///   [0, 0, 1, 0],
///   [0, 0, 0, 0],
/// ]
/// becomes
/// [
///   [0, 1, 0, 0],
///   [1, 1, 0, 0],
///   [0, 1, 0, 0],
///   [0, 0, 0, 0],
/// ]
/// ```
T shiftLeft<T extends Tetromino>(T tetromino) {
  if (!GridOperations.tetrominoEmpty(tetromino) &&
      hasEmptyColumnAtIndex(tetromino, 0)) {
    List<List<int>> shiftedGrid = List.from(tetromino);

    for (int i = 0; i < shiftedGrid.length; i++) {
      shiftedGrid[i].removeAt(0);
      shiftedGrid[i].add(0);
    }

    log("[shiftLeft] Operation successfull.");
    return tetromino.copyWith(shiftedGrid) as T;
  }

  return tetromino;
}

/// [shiftRight]
///
/// Shift right operation by one position.
///
/// Example:
/// ```dart
/// [
///   [0, 0, 1, 0],
///   [0, 1, 1, 0],
///   [0, 0, 1, 0],
///   [0, 0, 0, 0],
/// ]
/// becomes
/// [
///   [0, 0, 0, 1],
///   [0, 0, 1, 1],
///   [0, 0, 0, 1],
///   [0, 0, 0, 0],
/// ]
/// ```
T shiftRight<T extends Tetromino>(T tetromino) {
  if (!GridOperations.tetrominoEmpty(tetromino) &&
      hasEmptyColumnAtIndex(tetromino, tetromino.length - 1)) {
    List<List<int>> shiftedGrid = List.from(tetromino);

    for (int i = 0; i < shiftedGrid.length; i++) {
      shiftedGrid[i].removeLast();
      shiftedGrid[i].insert(0, 0);
    }

    log("[shiftRight] Operation successfull.");
    return tetromino.copyWith(shiftedGrid) as T;
  }

  return tetromino;
}
