import 'package:pila/config/defaults.dart';
import 'package:pila/models/tetromino.dart';
import 'package:pila/utils/logger.dart';

/// [GridOperations]
///
/// This class defines operations performed on grids in general.
class GridOperations {
  static final int gridSize = gridLength;

  /// [subtractGrids]
  ///
  /// This method substracts the two input grids from each other element-wise.
  /// @param gridA The first grid.
  /// @param gridB The second grid.
  /// @return New grid of type Tetromino with results of the subtraction operation of gridA and gridB.
  ///
  /// Example:
  /// GridA
  /// [
  ///   [1, 2, 3, 4],
  ///   [1, 2, 3, 4],
  ///   [1, 2, 3, 4],
  ///   [1, 2, 3, 4],
  /// ]
  ///  * GridB
  /// [
  ///   [0, 0, 1, 0],
  ///   [0, 0, 1, 0],
  ///   [0, 0, 1, 0],
  ///   [0, 0, 1, 0],
  /// ]
  ///  * resultGrid
  /// [
  ///   [1, 2, 2, 4],
  ///   [1, 2, 2, 4],
  ///   [1, 2, 2, 4],
  ///   [1, 2, 2, 4],
  /// ]
  static Tetromino subtractGrids(
      {required Tetromino gridA, required Tetromino gridB}) {
    List<List<int>> resultGrid = [];

    if (gridA.length != gridSize || gridB.length != gridSize) {
      throw ArgumentError('Both grids must have the same size of $gridSize.');
    }

    // Outer loop: iteration over rows
    for (int i = 0; i < gridSize; i++) {
      List<int> rowA = gridA[i];
      List<int> rowB = gridB[i];

      if (rowA.length != gridSize || rowB.length != gridSize) {
        throw ArgumentError(
            'All rows must have the same number of rows of $gridSize.');
      }

      List<int> newRow = [];
      // Inner loop: iteration over columns
      for (int j = 0; j < gridSize; j++) {
        int difference = rowA[j] - rowB[j];
        newRow.add(difference);
      }

      resultGrid.add(newRow);
    }

    log("[subtractGrids] Result after substraction: $resultGrid");
    return Tetromino.fromExistingGrid(resultGrid);
  }

  /// [addGrids]
  ///
  /// This method adds the two input grids from each other element-wise.
  /// @param gridA The first grid.
  /// @param gridB The second grid.
  /// @return New grid of type Tetromino with results of the addition operation of gridA and gridB.
  ///
  /// Example:
  /// GridA
  /// [
  ///   [1, 2, 3, 4],
  ///   [1, 2, 3, 4],
  ///   [1, 2, 3, 4],
  ///   [1, 2, 3, 4],
  /// ]
  ///  * GridB
  /// [
  ///   [0, 0, 1, 0],
  ///   [0, 0, 1, 0],
  ///   [0, 0, 1, 0],
  ///   [0, 0, 1, 0],
  /// ]
  ///  * resultGrid
  /// [
  ///   [1, 2, 4, 4],
  ///   [1, 2, 4, 4],
  ///   [1, 2, 4, 4],
  ///   [1, 2, 4, 4],
  /// ]
  static Tetromino addGrids(
      {required Tetromino gridA, required Tetromino gridB}) {
    List<List<int>> resultGrid = [];

    if (gridA.length != gridSize || gridB.length != gridSize) {
      throw ArgumentError('Both grids must have the same size of $gridSize.');
    }

    // Outer loop: iteration over rows
    for (int i = 0; i < gridSize; i++) {
      List<int> rowA = gridA[i];
      List<int> rowB = gridB[i];

      if (rowA.length != gridSize || rowB.length != gridSize) {
        throw ArgumentError(
            'All rows must have the same number of rows of $gridSize.');
      }

      List<int> newRow = [];
      // Inner loop: iteration over columns
      for (int j = 0; j < gridSize; j++) {
        int addition = rowA[j] + rowB[j];
        newRow.add(addition);
      }

      resultGrid.add(newRow);
    }

    log("[addGrids] Result after addition: $resultGrid");
    return Tetromino.fromExistingGrid(resultGrid);
  }

  /// [tetrominoEmpty]
  ///
  /// This method returns a boolean, if the given tetromino is empty.
  /// This action is performed usually after each apply or subtraction.
  /// This is used for example, to check if the level is finished.
  ///
  /// It checks if the supplied tetromino matches
  /// ```dart
  /// [
  ///   [0, 0, 0, 0],
  ///   [0, 0, 0, 0],
  ///   [0, 0, 0, 0],
  ///   [0, 0, 0, 0],
  /// ]
  /// ```
  static bool tetrominoEmpty(Tetromino tetromino) {
    Tetromino emptyStage = Tetromino();
    if (emptyStage.length != tetromino.length ||
        emptyStage[0].length != tetromino[0].length) {
      return false;
    }

    for (int i = 0; i < emptyStage.length; i++) {
      for (int j = 0; j < emptyStage[i].length; j++) {
        if (emptyStage[i][j] != tetromino[i][j]) {
          /// At least on entry is not matching
          //log("[tetrominoEmpty] Passed tetromino not empty.");
          return false;
        }
      }
    }
    //log("[tetrominoEmpty] Passed tetromino is empty.");
    return true;
  }

  /// [gridsubtractionAllowed]
  ///
  /// This method returns a boolean if it is possible to perform a substraction action.
  /// It checks if subtracting the grids does not result in negative numbers in grid, otherwise operation is not permitted.
  static bool gridsubtractionAllowed(
      {required Tetromino gridA, required Tetromino gridB}) {
    for (int i = 0; i < gridA.length; i++) {
      for (int j = 0; j < gridA[i].length; j++) {
        if (gridA[i][j] - gridB[i][j] < 0) {
          log("[gridsubtractionAllowed] Action not allowed, would result in negative values.");
          return false;
        }
      }
    }

    log("[gridsubtractionAllowed] Action allowed, resulting values would be non-negative.");
    return true;
  }
}
