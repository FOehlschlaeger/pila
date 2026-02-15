import 'package:test/test.dart';
import 'package:pila/functions/tetromino_operations.dart';
import 'package:pila/models/tetromino.dart';

void main() {
  // Testing operations on tetrominoI
  // [
  //   [0, 0, 1, 0],
  //   [0, 0, 1, 0],
  //   [0, 0, 1, 0],
  //   [0, 0, 1, 0]
  // ]
  Tetromino testingTetrominoShiftedDown = Tetromino.fromExistingGrid([
    [0,0,1,0],
    [0,0,1,0],
    [0,0,1,0],
    [0,0,1,0],
  ]);
  Tetromino testingTetrominoShiftedDownThreeTimes = Tetromino.fromExistingGrid([
    [0,0,1,0],
    [0,0,1,0],
    [0,0,1,0],
    [0,0,1,0],
  ]);
  Tetromino testingTetrominoShiftedUp = Tetromino.fromExistingGrid([
    [0,0,1,0],
    [0,0,1,0],
    [0,0,1,0],
    [0,0,1,0],
  ]);
  Tetromino testingTetrominoShiftedUpThreeTimes = Tetromino.fromExistingGrid([
    [0,0,1,0],
    [0,0,1,0],
    [0,0,1,0],
    [0,0,1,0],
  ]);
  Tetromino testingTetrominoShiftedLeft = Tetromino.fromExistingGrid([
    [0,1,0,0],
    [0,1,0,0],
    [0,1,0,0],
    [0,1,0,0],
  ]);
  Tetromino testingTetrominoShiftedLeftThreeTimes = Tetromino.fromExistingGrid([
    [1,0,0,0],
    [1,0,0,0],
    [1,0,0,0],
    [1,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedRight = Tetromino.fromExistingGrid([
    [0,0,0,1],
    [0,0,0,1],
    [0,0,0,1],
    [0,0,0,1],
  ]);
  Tetromino testingTetrominoShiftedRightThreeTimes = Tetromino.fromExistingGrid([
    [0,0,0,1],
    [0,0,0,1],
    [0,0,0,1],
    [0,0,0,1],
  ]);
  Tetromino testingTetrominoRotatedOnce = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,0,0,0],
    [1,1,1,1],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoRotatedTwice = Tetromino.fromExistingGrid([
    [0,1,0,0],
    [0,1,0,0],
    [0,1,0,0],
    [0,1,0,0],
  ]);
  Tetromino testingTetrominoRotatedThreeTimes = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [1,1,1,1],
    [0,0,0,0],
    [0,0,0,0],
  ]);

  group('Shifting operations', () {
    test('up once', () {
      Tetromino testingTetromino = TetrominoI();
      final result = shiftUp(testingTetromino);
      expect(result, testingTetrominoShiftedUp);

      expect(result.runtimeType, TetrominoI);
    });
    
    test('up three times', () {
      Tetromino testingTetromino = TetrominoI();
      final result = shiftUp(shiftUp(shiftUp(testingTetromino)));
      expect(result, testingTetrominoShiftedUpThreeTimes);

      expect(result.runtimeType, TetrominoI);
    });

    test('down once', () {
      Tetromino testingTetromino = TetrominoI();
      final result = shiftDown(testingTetromino);
      expect(result, testingTetrominoShiftedDown);

      expect(result.runtimeType, TetrominoI);
    });

    test('down three times', () {
      Tetromino testingTetromino = TetrominoI();
      final result = shiftDown(shiftDown(shiftDown(testingTetromino)));
      expect(result, testingTetrominoShiftedDownThreeTimes);

      expect(result.runtimeType, TetrominoI);
    });

    test('left once', () {
      Tetromino testingTetromino = TetrominoI();
      final result = shiftLeft(testingTetromino);
      expect(result, testingTetrominoShiftedLeft);

      expect(result.runtimeType, TetrominoI);
    });

    test('left three times', () {
      Tetromino testingTetromino = TetrominoI();
      final result = shiftLeft(shiftLeft(shiftLeft(testingTetromino)));
      expect(result, testingTetrominoShiftedLeftThreeTimes);

      expect(result.runtimeType, TetrominoI);
    });

    test('right once', () {
      Tetromino testingTetromino = TetrominoI();
      final result = shiftRight(testingTetromino);
      expect(result, testingTetrominoShiftedRight);

      expect(result.runtimeType, TetrominoI);
    });

    test('right three times', () {
      Tetromino testingTetromino = TetrominoI();
      final result = shiftRight(shiftRight(shiftRight(testingTetromino)));
      expect(result, testingTetrominoShiftedRightThreeTimes);

      expect(result.runtimeType, TetrominoI);
    });

    test('rotate once', () {
      Tetromino testingTetromino = TetrominoI();
      final result = rotate(testingTetromino);
      expect(result, testingTetrominoRotatedOnce);

      expect(result.runtimeType, TetrominoI);
    });

    test('rotate twice', () {
      Tetromino testingTetromino = TetrominoI();
      final result = rotate(rotate(testingTetromino));
      expect(result, testingTetrominoRotatedTwice);

      expect(result.runtimeType, TetrominoI);
    });

    test('rotate three times', () {
      Tetromino testingTetromino = TetrominoI();
      final result = rotate(rotate(rotate(testingTetromino)));
      expect(result, testingTetrominoRotatedThreeTimes);

      expect(result.runtimeType, TetrominoI);
    });

    test('rotate four times, should equal no rotation', () {
      Tetromino testingTetromino = TetrominoI();
      final result = rotate(rotate(rotate(rotate(testingTetromino))));
      expect(result, testingTetromino);

      expect(result.runtimeType, TetrominoI);
    });
  });
}