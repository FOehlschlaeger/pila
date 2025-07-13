import 'dart:math';

import '/config/defaults.dart';

/*
Set the four single integer values of each tetromino tile.
This function is called each time a new tile is selected.
Set random number four times to get different numbers in range from 1 to 5.
 */
int defineTetrominoNumber() {
  int singleTetrominoNumber = defaultValue;
  if (!defaultValueActive) {
    singleTetrominoNumber = Random().nextInt(randomNumberLimit - 1) + 1;
  }
  return singleTetrominoNumber;
}

/*
General tetromino class.
Each tetromino is a 2d array with columns and rows given from defaults.
 */
// class Tetromino extends ListBase {
class Tetromino {
  List<List<int>> basic = List.generate(
      defaultRows, (i) => List.generate(defaultColumns, (j) => 0));

  Tetromino();

  // @override
  // int length = defaultColumns;
  //
  // @override
  // operator [](int index) {
  // return this[index];
  // }
  //
  // @override
  // void operator []=(int index, value) {
  // this[index] = value;
  // }
}

/*
  Factory constructors for each tetromino
   */
// /*
// Tetromino J - Basic
// [
//   [0, 0, 1, 0],
//   [0, 0, 1, 0],
//   [0, 1, 1, 0],
//   [0, 0, 0, 0]
// ]
// */
// factory Tetromino.tetrominoJ() {
//   return Tetromino([
//     [0, 0, defineTetrominoNumber(), 0],
//     [0, 0, defineTetrominoNumber(), 0],
//     [0, defineTetrominoNumber(), defineTetrominoNumber(), 0],
//     [0, 0, 0, 0],
//   ]);
// }
