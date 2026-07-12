import 'package:pila/functions/grid_operations.dart';
import 'package:pila/models/tetromino.dart';
import 'package:test/test.dart';

void main() {
  group('Grid operations', () {
    test('adding two grids with J and O', () {
      Tetromino testingTetrominoJ = TetrominoJ();
      Tetromino testingTetrominoO = TetrominoO();
      Tetromino addedResult = Tetromino.fromExistingGrid([
        [0, 0, 1, 0],
        [0, 1, 2, 0],
        [0, 2, 2, 0],
        [0, 0, 0, 0],
      ]);

      final result = GridOperations.addGrids(
          gridA: testingTetrominoJ, gridB: testingTetrominoO);
      expect(result, addedResult);
    });

    test('subtracting two grids from J+O first J, then O', () {
      Tetromino testingTetrominoJ = TetrominoJ();
      Tetromino testingTetrominoO = TetrominoO();
      final Tetromino addedResult = GridOperations.addGrids(
          gridA: testingTetrominoJ, gridB: testingTetrominoO);
      Tetromino firstSubstraction = Tetromino.fromExistingGrid([
        [0, 0, 0, 0],
        [0, 1, 1, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0],
      ]);
      Tetromino secondSubstraction = Tetromino.fromExistingGrid([
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
        [0, 0, 0, 0],
      ]);

      // First substraction
      final resultFirstSubstraction = GridOperations.subtractGrids(
          gridA: addedResult, gridB: testingTetrominoJ);
      expect(resultFirstSubstraction, firstSubstraction);

      // Check if stage would be clear, should fail
      final bool stageNotClear =
          GridOperations.tetrominoEmpty(resultFirstSubstraction);
      expect(stageNotClear, false);

      // Second substraction
      final resultSecondSubstraction = GridOperations.subtractGrids(
          gridA: resultFirstSubstraction, gridB: testingTetrominoO);
      expect(resultSecondSubstraction, secondSubstraction);

      // Check if stage is clear, should work
      final bool stageClear =
          GridOperations.tetrominoEmpty(resultSecondSubstraction);
      expect(stageClear, true);
    });
  });
}
