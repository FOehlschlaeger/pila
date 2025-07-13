import 'package:pila/models/tetromino.dart';

import '../functions/tetrominoActions.dart';

/*
Tetromino L - Basic
[
  [0, 1, 0, 0],
  [0, 1, 0, 0],
  [0, 1, 1, 0],
  [0, 0, 0, 0]
]
 */
class TetrominoL extends Tetromino {
  List<List<int>> basic = [
    [0, defineTetrominoNumber(), 0, 0],
    [0, defineTetrominoNumber(), 0, 0],
    [0, defineTetrominoNumber(), defineTetrominoNumber(), 0],
    [0, 0, 0, 0],
  ];

  TetrominoL();
}

void main() {
  TetrominoL test = TetrominoL();
  print("Basic Tetromino L: ${test.basic}");

  var down = shiftDown(test.basic);
  print("shift down: $down");
  var shiftdown2 = shiftDown(test.basic);
  print(shiftDown(shiftdown2));

  var shiftup = shiftUp(test.basic);
  print("shiftUp: $shiftup");

  print("neuer tetromino");
  TetrominoL test2 = TetrominoL();
  print(test2.basic);

  print("rotate 1");
  List<List<int>> test2_rot1 = rotate(test2.basic);
  print(test2_rot1);

  print("rotate 2");
  List<List<int>> test2_rot2 = rotate(test2_rot1);
  print(test2_rot2);

  print("rotate 3");
  List<List<int>> test2_rot3 = rotate(test2_rot2);
  print(test2_rot3);

  print("rotate 4");
  List<List<int>> test2_rot4 = rotate(test2_rot3);
  print(test2_rot4);

  print("shift left");
  print(shiftLeft(test2.basic));

  print("shift right");
  print(shiftRight(test2.basic));

  print("shift right");
  print(shiftRight(test2.basic));

  print("shift right");
  print(shiftRight(test2.basic));
}
