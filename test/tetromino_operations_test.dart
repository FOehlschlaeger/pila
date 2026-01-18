import 'package:test/test.dart';
import 'package:pila/functions/tetromino_operations.dart';
import 'package:pila/models/tetromino.dart';

void main() {

  Tetromino testingTetrominoShiftedDown = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,0,1,0],
    [0,0,1,0],
    [0,1,1,0],
  ]);
  Tetromino testingTetrominoShiftedUp = Tetromino.fromExistingGrid([
    [0,0,1,0],
    [0,0,1,0],
    [0,1,1,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedLeft = Tetromino.fromExistingGrid([
    [0,1,0,0],
    [0,1,0,0],
    [1,1,0,0],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoShiftedRight = Tetromino.fromExistingGrid([
    [0,0,0,1],
    [0,0,0,1],
    [0,0,1,1],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoRotatedOnce = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,1,0,0],
    [0,1,1,1],
    [0,0,0,0],
  ]);
  Tetromino testingTetrominoRotatedTwice = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [0,1,1,0],
    [0,1,0,0],
    [0,1,0,0],
  ]);
  Tetromino testingTetrominoRotatedThreeTimes = Tetromino.fromExistingGrid([
    [0,0,0,0],
    [1,1,1,0],
    [0,0,1,0],
    [0,0,0,0],
  ]);

  group('Shifting operations', () {
    test('up once', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = shiftUp(testingTetromino);
      expect(result, testingTetrominoShiftedUp);
    });
    
    test('up three times', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = shiftUp(shiftUp(shiftUp(testingTetromino)));
      expect(result, testingTetrominoShiftedUp);
    });

    test('down once', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = shiftDown(testingTetromino);
      expect(result, testingTetrominoShiftedDown);
    });

    test('down three times', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = shiftDown(shiftDown(shiftDown(testingTetromino)));
      expect(result, testingTetrominoShiftedDown);
    });

    test('left once', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = shiftLeft(testingTetromino);
      expect(result, testingTetrominoShiftedLeft);
    });

    test('left three times', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = shiftLeft(shiftLeft(shiftLeft(testingTetromino)));
      expect(result, testingTetrominoShiftedLeft);
    });

    test('right once', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = shiftRight(testingTetromino);
      expect(result, testingTetrominoShiftedRight);
    });

    test('right three times', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = shiftRight(shiftRight(shiftRight(testingTetromino)));
      expect(result, testingTetrominoShiftedRight);
    });

    test('rotate once', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = rotate(testingTetromino);
      expect(result, testingTetrominoRotatedOnce);
    });

    test('rotate twice', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = rotate(rotate(testingTetromino));
      expect(result, testingTetrominoRotatedTwice);
    });

    test('rotate three times', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = rotate(rotate(rotate(testingTetromino)));
      expect(result, testingTetrominoRotatedThreeTimes);
    });

    test('rotate four times, should equal no rotation', () {
      Tetromino testingTetromino = TetrominoJ();
      final result = rotate(rotate(rotate(rotate(testingTetromino))));
      expect(result, testingTetromino);
    });
  });
}