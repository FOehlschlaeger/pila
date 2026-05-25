/// This class defines methods to be applied to the state of the level.
library;

import 'package:pila/functions/grid_operations.dart';
import 'package:pila/models/level_state.dart';
import 'package:pila/models/tetromino.dart';
import 'dart:math';
import 'package:pila/config/defaults.dart';
import 'package:pila/functions/tetromino_operations.dart';

class StateManagement {
  // List of all available tetromino tiles to select to generate the level
  static final List<Tetromino> tetrominoTiles = [
    TetrominoI(), 
    TetrominoJ(),
    TetrominoL(),
    TetrominoO(),
    TetrominoS(),
    TetrominoZ(),
    TetrominoT(),
  ];

  // List of all available operations to perform on a single tetromino tile
  static final List<Function> tetrominoOperations = [
    rotate,
    shiftUp,
    shiftDown,
    shiftLeft,
    shiftRight,
  ];

  static LevelState generateNewLevelstate ([int minTileCounter = lowerTileCounter, int maxTileCounter = upperTileCounter]) {
    // This function returns a map of tetromino tiles used for the generated level and the last state
    LevelState outputState = LevelState(); 

    // Create list of level states by adding randomly modified tetromino tiles for each list entry
    final randomTetrominoCounter = Random();
    int next(int min, int max) => min + randomTetrominoCounter.nextInt(max - min);

    List<Tetromino> stateTetrominos = [];
    for (var i = 0; i < next(minTileCounter, maxTileCounter); i++) {
      Tetromino currentTile = _prepareSingleTetromino();
      stateTetrominos.add(currentTile);
      outputState['counter_${currentTile.runtimeType.toString()}']['initial'] += 1;
      outputState['counter_${currentTile.runtimeType.toString()}']['current'] += 1;
    }

    // Map levelState = {
    //   'list_tetrominos': stateTetrominos,
    //   'final_state': stateTetrominos[tetrominoTotalCount - 1],
    // };

    // Set values to output state to be returned
    // The initial_state of the initialized level state is the grid state with all tiles added up
    Tetromino initialState = Tetromino();
    for (int t = 0; t < stateTetrominos.length; t++) {
      initialState = GridOperations.addGrids(gridA: initialState , gridB: stateTetrominos[t]);
    }
    outputState.lvlstate['initial_state'] = initialState;
    outputState.lvlstate['tile_list'] = stateTetrominos;
    outputState.lvlstate['current_state'] = initialState;

    return outputState;
  }

  static Tetromino _prepareSingleTetromino ([int minTileOperation = lowerTileOperation, int maxTileOperation = upperTileOperation]) {
    // This function applies a random number of randomly chosen operations on a single tetromino tile.
    final randomTile = Random();
    Tetromino singleTile = tetrominoTiles[randomTile.nextInt(tetrominoTiles.length)];
    // print("debugging: randomly selected tile: $singleTile");
    // print("debugging: Class of singleTile: ${singleTile.runtimeType.toString()}");

    // Apply to single tetromino tile a set of randomly chosen operations
    final randomOperationCount = Random();
    int next(int min, int max) => min + randomOperationCount.nextInt(max - min);
    
    List<Function> randomOperationList = [];
    for (int i = 0; i < next(minTileOperation, maxTileOperation); i++) {
      final randomOperationFromList = Random();
      int randomOperation(int min, int max) => min + randomOperationFromList.nextInt(max - min);
      randomOperationList.add(tetrominoOperations[randomOperation(0, tetrominoOperations.length)]);
    }
    print("debugging : OperationList $randomOperationList");

    Tetromino modifiedTile = singleTile;
    for (int i = 0; i < randomOperationList.length; i++) {
      modifiedTile = Function.apply(randomOperationList[i], [modifiedTile]);
      // print("debugging [$i]: modifiedTile after applying ${randomOperationList[i]}");
      // print("debugging [$i]: modified tile: $modifiedTile");
      // print("debugging [$i]: Class of modifiedTile: ${modifiedTile.runtimeType.toString()}");
    }

    return modifiedTile;
  }
}

void main() {
  // Tetromino testMap = StateManagement._prepareSingleTetromino();
  // print("Test to get grid from Tetromino: ${testMap["tetrominoTile"]!.grid}");
  // print("This is a test tetromino");
  // print(testMap);
  // Tetromino preparedTetrominoSingleTile = testMap["tetrominoTile"];
  // print("Class of singleTile: ${testMap.runtimeType.toString()}");

  LevelState testState = StateManagement.generateNewLevelstate();
  print("testState: $testState");
}