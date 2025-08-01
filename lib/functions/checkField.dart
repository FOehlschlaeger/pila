import 'package:pila/models/tetromino.dart';

/*
Check field if stage is cleared.
After each apply of a tetromino, call this check function.

Field must match empty tetromino.

Check if given current field after previous application matches
[
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0],
  [0, 0, 0, 0]
]
 */
bool checkStageClear(List<List<int>> tetromino) {
  List<List<int>> emptyStage = Tetromino().basic;

  // First check dimensions of given tetromino
  if (emptyStage.length != tetromino.length ||
      emptyStage[0].length != tetromino[0].length) {
    return false;
  }

  for (int i = 0; i < emptyStage.length; i++) {
    for (int j = 0; j < emptyStage[i].length; j++) {
      if (emptyStage[i][j] != tetromino[i][j]) {
        // At least on entry is not matching
        return false;
      }
    }
  }
  // All entries match each other
  return true;
}

// void main() {
//   List<List<int>> a = [
//     [0, 0, 0, 0],
//     [0, 0, 0, 0],
//     [0, 0, 0, 0],
//     [0, 0, 0, 0]
//   ];
//   print("check stage clear: ${checkStageClear(a)}");
// }
