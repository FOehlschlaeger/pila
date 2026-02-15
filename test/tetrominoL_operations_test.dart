import 'package:test/test.dart';
import 'package:pila/functions/tetromino_operations.dart';
import 'package:pila/models/tetromino.dart';

void main() {
  // Testing operations on tetrominoL
  // [
  //   [0, 1, 0, 0],
  //   [0, 1, 0, 0],
  //   [0, 1, 1, 0],
  //   [0, 0, 0, 0]
  // ]
  Tetromino testingTetrominoShiftedDown = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,1,0,0],
    [0,1,0,0],
    [0,1,1,0],
  ]);
  Tetromino testingTetrominoShiftedDownThreeTimes = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,1,0,0],
    [0,1,0,0],
    [0,1,1,0],
  ]);
  Tetromino testingTetrominoShiftedUp = Tetromino.fromExistingGrid([
    [0,1,0,0],
    [0,1,0,0],
    [0,1,1,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedUpThreeTimes = Tetromino.fromExistingGrid([
    [0,1,0,0],
    [0,1,0,0],
    [0,1,1,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedLeft = Tetromino.fromExistingGrid([
    [1,0,0,0],
    [1,0,0,0],
    [1,1,0,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedLeftThreeTimes = Tetromino.fromExistingGrid([
    [1,0,0,0],
    [1,0,0,0],
    [1,1,0,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedRight = Tetromino.fromExistingGrid([
    [0,0,1,0],
    [0,0,1,0],
    [0,0,1,1],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedRightThreeTimes = Tetromino.fromExistingGrid([
    [0,0,1,0],
    [0,0,1,0],
    [0,0,1,1],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoRotatedOnce = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,1,1,1],
    [0,1,0,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoRotatedTwice = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,1,1,0],
    [0,0,1,0],
    [0,0,1,0],
  ]);
  Tetromino testingTetrominoRotatedThreeTimes = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,0,1,0],
    [1,1,1,0],
    [0,0,0,0],
  ]);

  group('Shifting operations', () {
    test('up once', () {
      Tetromino testingTetromino = TetrominoL();
      final result = shiftUp(testingTetromino);
      expect(result, testingTetrominoShiftedUp);

      expect(result.runtimeType, TetrominoL);
    });
    
    test('up three times', () {
      Tetromino testingTetromino = TetrominoL();
      final result = shiftUp(shiftUp(shiftUp(testingTetromino)));
      expect(result, testingTetrominoShiftedUpThreeTimes);

      expect(result.runtimeType, TetrominoL);
    });

    test('down once', () {
      Tetromino testingTetromino = TetrominoL();
      final result = shiftDown(testingTetromino);
      expect(result, testingTetrominoShiftedDown);

      expect(result.runtimeType, TetrominoL);
    });

    test('down three times', () {
      Tetromino testingTetromino = TetrominoL();
      final result = shiftDown(shiftDown(shiftDown(testingTetromino)));
      expect(result, testingTetrominoShiftedDownThreeTimes);

      expect(result.runtimeType, TetrominoL);
    });

    test('left once', () {
      Tetromino testingTetromino = TetrominoL();
      final result = shiftLeft(testingTetromino);
      expect(result, testingTetrominoShiftedLeft);

      expect(result.runtimeType, TetrominoL);
    });

    test('left three times', () {
      Tetromino testingTetromino = TetrominoL();
      final result = shiftLeft(shiftLeft(shiftLeft(testingTetromino)));
      expect(result, testingTetrominoShiftedLeftThreeTimes);

      expect(result.runtimeType, TetrominoL);
    });

    test('right once', () {
      Tetromino testingTetromino = TetrominoL();
      final result = shiftRight(testingTetromino);
      expect(result, testingTetrominoShiftedRight);

      expect(result.runtimeType, TetrominoL);
    });

    test('right three times', () {
      Tetromino testingTetromino = TetrominoL();
      final result = shiftRight(shiftRight(shiftRight(testingTetromino)));
      expect(result, testingTetrominoShiftedRightThreeTimes);

      expect(result.runtimeType, TetrominoL);
    });

    test('rotate once', () {
      Tetromino testingTetromino = TetrominoL();
      final result = rotate(testingTetromino);
      expect(result, testingTetrominoRotatedOnce);

      expect(result.runtimeType, TetrominoL);
    });

    test('rotate twice', () {
      Tetromino testingTetromino = TetrominoL();
      final result = rotate(rotate(testingTetromino));
      expect(result, testingTetrominoRotatedTwice);

      expect(result.runtimeType, TetrominoL);
    });

    test('rotate three times', () {
      Tetromino testingTetromino = TetrominoL();
      final result = rotate(rotate(rotate(testingTetromino)));
      expect(result, testingTetrominoRotatedThreeTimes);

      expect(result.runtimeType, TetrominoL);
    });

    test('rotate four times, should equal no rotation', () {
      Tetromino testingTetromino = TetrominoL();
      final result = rotate(rotate(rotate(rotate(testingTetromino))));
      expect(result, testingTetromino);

      expect(result.runtimeType, TetrominoL);
    });
  });
}