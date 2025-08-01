import 'tetromino.dart';

/*
Tetromino T - Basic
[
  [0, 0, 0, 0],
  [1, 1, 1, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 0]
]
 */
class TetrominoT extends Tetromino {
  List<List<int>> basic = [
    [0, 0, 0, 0],
    [
      defineTetrominoNumber(),
      defineTetrominoNumber(),
      defineTetrominoNumber(),
      0
    ],
    [0, defineTetrominoNumber(), 0, 0],
    [0, 0, 0, 0],
  ];

  TetrominoT();
}
