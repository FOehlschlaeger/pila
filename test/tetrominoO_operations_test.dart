import 'package:test/test.dart';
import 'package:pila/functions/tetromino_operations.dart';
import 'package:pila/models/tetromino.dart';

void main() {
  // Testing operations on tetrominoO
  // [
  //   [0, 0, 0, 0],
  //   [0, 1, 1, 0],
  //   [0, 1, 1, 0],
  //   [0, 0, 0, 0]
  // ]
  Tetromino testingTetrominoShiftedDown = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,0,0,0],
    [0,1,1,0],
    [0,1,1,0],
  ]);
  Tetromino testingTetrominoShiftedDownThreeTimes = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,0,0,0],
    [0,1,1,0],
    [0,1,1,0],
  ]);
  Tetromino testingTetrominoShiftedUp = Tetromino.fromExistingGrid([
    [0,1,1,0],
    [0,1,1,0],
    [0,0,0,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedUpThreeTimes = Tetromino.fromExistingGrid([
    [0,1,1,0],
    [0,1,1,0],
    [0,0,0,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedLeft = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [1,1,0,0],
    [1,1,0,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedLeftThreeTimes = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [1,1,0,0],
    [1,1,0,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedRight = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,0,1,1],
    [0,0,1,1],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedRightThreeTimes = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,0,1,1],
    [0,0,1,1],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoRotatedOnce = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,1,1,0],
    [0,1,1,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoRotatedTwice = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,1,1,0],
    [0,1,1,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoRotatedThreeTimes = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,1,1,0],
    [0,1,1,0],
    [0,0,0,0],
  ]);

  group('Shifting operations', () {
    test('up once', () {
      Tetromino testingTetromino = TetrominoO();
      final result = shiftUp(testingTetromino);
      expect(result, testingTetrominoShiftedUp);

      expect(result.runtimeType, TetrominoO);
    });
    
    test('up three times', () {
      Tetromino testingTetromino = TetrominoO();
      final result = shiftUp(shiftUp(shiftUp(testingTetromino)));
      expect(result, testingTetrominoShiftedUpThreeTimes);

      expect(result.runtimeType, TetrominoO);
    });

    test('down once', () {
      Tetromino testingTetromino = TetrominoO();
      final result = shiftDown(testingTetromino);
      expect(result, testingTetrominoShiftedDown);

      expect(result.runtimeType, TetrominoO);
    });

    test('down three times', () {
      Tetromino testingTetromino = TetrominoO();
      final result = shiftDown(shiftDown(shiftDown(testingTetromino)));
      expect(result, testingTetrominoShiftedDownThreeTimes);

      expect(result.runtimeType, TetrominoO);
    });

    test('left once', () {
      Tetromino testingTetromino = TetrominoO();
      final result = shiftLeft(testingTetromino);
      expect(result, testingTetrominoShiftedLeft);

      expect(result.runtimeType, TetrominoO);
    });

    test('left three times', () {
      Tetromino testingTetromino = TetrominoO();
      final result = shiftLeft(shiftLeft(shiftLeft(testingTetromino)));
      expect(result, testingTetrominoShiftedLeftThreeTimes);

      expect(result.runtimeType, TetrominoO);
    });

    test('right once', () {
      Tetromino testingTetromino = TetrominoO();
      final result = shiftRight(testingTetromino);
      expect(result, testingTetrominoShiftedRight);

      expect(result.runtimeType, TetrominoO);
    });

    test('right three times', () {
      Tetromino testingTetromino = TetrominoO();
      final result = shiftRight(shiftRight(shiftRight(testingTetromino)));
      expect(result, testingTetrominoShiftedRightThreeTimes);

      expect(result.runtimeType, TetrominoO);
    });

    test('rotate once', () {
      Tetromino testingTetromino = TetrominoO();
      final result = rotate(testingTetromino);
      expect(result, testingTetrominoRotatedOnce);

      expect(result.runtimeType, TetrominoO);
    });

    test('rotate twice', () {
      Tetromino testingTetromino = TetrominoO();
      final result = rotate(rotate(testingTetromino));
      expect(result, testingTetrominoRotatedTwice);

      expect(result.runtimeType, TetrominoO);
    });

    test('rotate three times', () {
      Tetromino testingTetromino = TetrominoO();
      final result = rotate(rotate(rotate(testingTetromino)));
      expect(result, testingTetrominoRotatedThreeTimes);

      expect(result.runtimeType, TetrominoO);
    });

    test('rotate four times, should equal no rotation', () {
      Tetromino testingTetromino = TetrominoO();
      final result = rotate(rotate(rotate(rotate(testingTetromino))));
      expect(result, testingTetromino);

      expect(result.runtimeType, TetrominoO);
    });
  });
}