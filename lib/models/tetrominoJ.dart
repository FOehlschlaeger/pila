import 'tetromino.dart';

/*
Tetromino J - Basic
[
  [0, 0, 1, 0],
  [0, 0, 1, 0],
  [0, 1, 1, 0],
  [0, 0, 0, 0]
]
 */
class TetrominoJ extends Tetromino {
  List<List<int>> basic = [
    [0, 0, defineTetrominoNumber(), 0],
    [0, 0, defineTetrominoNumber(), 0],
    [0, defineTetrominoNumber(), defineTetrominoNumber(), 0],
    [0, 0, 0, 0],
  ];

  TetrominoJ();
// TetrominoJ(this.basic) : super(basic);
}
