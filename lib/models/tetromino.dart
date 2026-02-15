/// General tetromino class.
/// Each tetromino is a 2d array with columns and rows given from defaults.
library;

import 'dart:collection';

import '/config/defaults.dart';

class Tetromino with ListMixin<List<int>> {
  final List<List<int>> _grid;

  Tetromino([int rows = defaultRows, int columns = defaultColumns])
      : _grid = List.generate(
          rows, 
          (i) => List.filled(columns, 0)
        );

  Tetromino.fromExistingGrid(List<List<int>> existingGrid) : _grid = existingGrid;

  Tetromino copyWith(List<List<int>> newGrid) {
    return Tetromino.fromExistingGrid(newGrid);
  }

  @override
  int get length => _grid.length;

  @override
  set length(int newLength) {
    _grid.length = newLength;
  }

  @override
  List<int> operator [](int index) {
    return _grid[index];
  }

  @override
  void operator []=(int index, List<int> value) {
    _grid[index] = value;
  }

  void addRow(List<int> row) {
    _grid.add(row);
  }

  int get columnSize {
    if (_grid.isEmpty) return 0;
    return _grid.first.length;
  }
}

// Tetromino I
// [
//   [0, 0, 1, 0],
//   [0, 0, 1, 0],
//   [0, 0, 1, 0],
//   [0, 0, 1, 0]
// ]
class TetrominoI extends Tetromino {

  TetrominoI._internal([List<List<int>>? grid])
    : super.fromExistingGrid(grid ?? [
      [0, 0, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 1, 0],
      [0, 0, 1, 0],
    ]);
  
  factory TetrominoI() {
    return TetrominoI._internal();
  }

  factory TetrominoI.fromGrid(List<List<int>> existingGrid) {
    return TetrominoI._internal(existingGrid);
  }

  @override
  TetrominoI copyWith(List<List<int>> newGrid) {
    return TetrominoI.fromGrid(newGrid);
  }
}

// Tetromino J
// [
//   [0, 0, 1, 0],
//   [0, 0, 1, 0],
//   [0, 1, 1, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoJ extends Tetromino {

  TetrominoJ._internal([List<List<int>>? grid])
    : super.fromExistingGrid(grid ?? [
      [0, 0, 1, 0],
      [0, 0, 1, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 0],
    ]);

  factory TetrominoJ() {
    return TetrominoJ._internal();
  }

  factory TetrominoJ.fromGrid(List<List<int>> existingGrid) {
    return TetrominoJ._internal(existingGrid);
  }

  @override
  TetrominoJ copyWith(List<List<int>> newGrid) {
    return TetrominoJ.fromGrid(newGrid);
  }
}

// Tetromino L
// [
//   [0, 1, 0, 0],
//   [0, 1, 0, 0],
//   [0, 1, 1, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoL extends Tetromino {

  TetrominoL._internal([List<List<int>>? grid])
    : super.fromExistingGrid(grid ?? [
      [0, 1, 0, 0],
      [0, 1, 0, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 0],
    ]);

  factory TetrominoL() {
    return TetrominoL._internal();
  }

  factory TetrominoL.fromGrid(List<List<int>> existingGrid) {
    return TetrominoL._internal(existingGrid);
  }

  @override
  TetrominoL copyWith(List<List<int>> newGrid) {
    return TetrominoL.fromGrid(newGrid);
  }
}

// Tetromino O
// [
//   [0, 0, 0, 0],
//   [0, 1, 1, 0],
//   [0, 1, 1, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoO extends Tetromino {

  TetrominoO._internal([List<List<int>>? grid])
    : super.fromExistingGrid(grid ?? [
      [0, 0, 0, 0],
      [0, 1, 1, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 0],
    ]);

  factory TetrominoO() {
    return TetrominoO._internal();
  }

  factory TetrominoO.fromGrid(List<List<int>> existingGrid) {
    return TetrominoO._internal(existingGrid);
  }

  @override
  TetrominoO copyWith(List<List<int>> newGrid) {
    return TetrominoO.fromGrid(newGrid);
  }
}

// Tetromino S
// [
//   [0, 0, 0, 0],
//   [0, 1, 1, 0],
//   [1, 1, 0, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoS extends Tetromino {
  
  TetrominoS._internal([List<List<int>>? grid])
    : super.fromExistingGrid(grid ?? [
      [0, 0, 0, 0],
      [0, 1, 1, 0],
      [1, 1, 0, 0],
      [0, 0, 0, 0],
    ]);

  factory TetrominoS() {
    return TetrominoS._internal();
  }

  factory TetrominoS.fromGrid(List<List<int>> existingGrid) {
    return TetrominoS._internal(existingGrid);
  }

  @override
  TetrominoS copyWith(List<List<int>> newGrid) {
    return TetrominoS.fromGrid(newGrid);
  }
}

// Tetromino T
// [
//   [0, 0, 0, 0],
//   [1, 1, 1, 0],
//   [0, 1, 0, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoT extends Tetromino {

  TetrominoT._internal([List<List<int>>? grid])
    : super.fromExistingGrid(grid ?? [
      [0, 0, 0, 0],
      [1, 1, 1, 0],
      [0, 1, 0, 0],
      [0, 0, 0, 0],
    ]);

  factory TetrominoT() {
    return TetrominoT._internal();
  }

  factory TetrominoT.fromGrid(List<List<int>> existingGrid) {
    return TetrominoT._internal(existingGrid);
  }

  @override
  TetrominoT copyWith(List<List<int>> newGrid) {
    return TetrominoT.fromGrid(newGrid);
  }
}

// Tetromino Z
// [
//   [0, 0, 0, 0],
//   [1, 1, 0, 0],
//   [0, 1, 1, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoZ extends Tetromino {
  
  TetrominoZ._internal([List<List<int>>? grid])
    : super.fromExistingGrid(grid ?? [
      [0, 0, 0, 0],
      [1, 1, 0, 0],
      [0, 1, 1, 0],
      [0, 0, 0, 0],
    ]);

  factory TetrominoZ() {
    return TetrominoZ._internal();
  }

  factory TetrominoZ.fromGrid(List<List<int>> existingGrid) {
    return TetrominoZ._internal(existingGrid);
  }

  @override
  TetrominoZ copyWith(List<List<int>> newGrid) {
    return TetrominoZ.fromGrid(newGrid);
  }
}
