import 'package:pila/models/tetromino.dart';

/// Here are some helper functions defined which are used for simple checking operations.

/// [hasEmptyRowAtIndex]
/// 
/// Check if row at index i contains only null.
/// 
/// Example:
/// ```dart
/// [
///   [0, 0, 0, 0],
///   [0, 1, 0, 0],
///   [1, 1, 1, 0],
///   [0, 0, 0, 0],
/// ]
/// ```
bool hasEmptyRowAtIndex(Tetromino l, int index) {
  for (var i = 0; i < l[index].length; i++) {
    if (l[index][i] != 0) {
      return false;
    }
  }
  return true;
}

/// [hasEmptyColumnAtIndex]
/// 
/// Check if column at index i contains only null.
/// 
/// Example:
/// ```dart
/// [
///   [0, 0, 1, 0],
///   [0, 1, 1, 0],
///   [0, 0, 1, 0],
///   [0, 0, 0, 0],
/// ]
/// ```
bool hasEmptyColumnAtIndex(Tetromino l, int index) {
  for (var i = 0; i < l.length; i++) {
    if (l[i][index] != 0) {
      return false;
    }
  }
  return true;
}
