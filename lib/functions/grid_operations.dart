import 'package:pila/config/defaults.dart';
import 'package:pila/models/tetromino.dart';

class GridOperations {
  // Size of square grid
  static final int gridSize = gridLength;

  /*
   * Subtracts two 4x4 grids (Tetromino) element-wise.
   * 
   * * @param gridA The first grid.
   * @param gridB The second grid.
   * @return New grid of type Tetromino with results of the subtraction operation of gridA and gridB.
   * 
   * GridA
  [
    [1, 2, 3, 4],
    [1, 2, 3, 4],
    [1, 2, 3, 4],
    [1, 2, 3, 4]
  ]
   * GridB
  [
    [0, 0, 1, 0],
    [0, 0, 1, 0],
    [0, 0, 1, 0],
    [0, 0, 1, 0]
  ]
   * resultGrid
  [
    [1, 2, 2, 4],
    [1, 2, 2, 4],
    [1, 2, 2, 4],
    [1, 2, 2, 4]
  ]
   */
  static Tetromino subtractGrids({required Tetromino gridA, required Tetromino gridB}) {
    // Tetromino resultGrid = Tetromino();
    List<List<int>> resultGrid = [];

    // Check for same size
    if (gridA.length != gridSize || gridB.length != gridSize) {
      throw ArgumentError('Both grids must have the same size of $gridSize.');
    }

    // Outer loop: iteration over rows
    for (int i = 0; i < gridSize; i++) {
      List<int> rowA = gridA[i];
      List<int> rowB = gridB[i];

      // Check for size
      if (rowA.length != gridSize || rowB.length != gridSize) {
        throw ArgumentError('All rows must have the same number of rows of $gridSize.');
      }

      List<int> newRow = [];

      // Inner loop: iteration over columns
      for (int j = 0; j < gridSize; j++) {
        int difference = rowA[j] - rowB[j];
        newRow.add(difference);
      }
      
      // Adding new row to resulting grid
      resultGrid.add(newRow);
    }

    return Tetromino.fromExistingGrid(resultGrid);
  }

  /*
   * Adds two 4x4 grids (Tetromino) element-wise.
   * 
   * * @param gridA The first grid.
   * @param gridB The second grid.
   * @return New grid of type Tetromino with results of the addition operation of gridA and gridB.
   * 
   * GridA
  [
    [1, 2, 3, 4],
    [1, 2, 3, 4],
    [1, 2, 3, 4],
    [1, 2, 3, 4]
  ]
   * GridB
  [
    [0, 0, 1, 0],
    [0, 0, 1, 0],
    [0, 0, 1, 0],
    [0, 0, 1, 0]
  ]
   * resultGrid
  [
    [1, 2, 4, 4],
    [1, 2, 4, 4],
    [1, 2, 4, 4],
    [1, 2, 4, 4]
  ]
   */
  static Tetromino addGrids({required Tetromino gridA, required Tetromino gridB}) {
    List<List<int>> resultGrid = [];

    // Check for same size
    if (gridA.length != gridSize || gridB.length != gridSize) {
      throw ArgumentError('Both grids must have the same size of $gridSize.');
    }

    // Outer loop: iteration over rows
    for (int i = 0; i < gridSize; i++) {
      List<int> rowA = gridA[i];
      List<int> rowB = gridB[i];

      // Check for size
      if (rowA.length != gridSize || rowB.length != gridSize) {
        throw ArgumentError('All rows must have the same number of rows of $gridSize.');
      }

      List<int> newRow = [];

      // Inner loop: iteration over columns
      for (int j = 0; j < gridSize; j++) {
        int addition = rowA[j] + rowB[j];
        newRow.add(addition);
      }
      
      // Adding new row to resulting grid
      resultGrid.add(newRow);
    }

    // Return tetromino from existing grid
    return Tetromino.fromExistingGrid(resultGrid);
  }

  /*
   * Check field if stage is cleared.
   * After each apply of a tetromino, call this check function.
   * 
   * Field must match empty tetromino.
   * 
   * Check if given current field after previous application matches
  [
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0],
    [0, 0, 0, 0]
  ]
  */
  static bool checkStageClear(Tetromino tetromino) {
    Tetromino emptyStage = Tetromino();

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
}