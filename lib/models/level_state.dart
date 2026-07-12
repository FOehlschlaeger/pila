library;

import 'dart:collection';

import 'package:pila/functions/grid_operations.dart';
import 'package:pila/functions/state_management.dart';
import 'package:pila/models/tetromino.dart';
import 'package:pila/utils/logger.dart';

/// [LevelState]
/// 
/// This class defines the state of the entire level at a point in time.
///
/// This includes different states of the level:
/// - initialized state at start
/// - current state of the level
/// - current chosen tetromino to be applied
///
/// Also the current set of available tetromino tiles for the level.
///
/// lvlstate = {
///   'initial_state': Tetromino() => initialized level at beginning, return to this state if level is reset
///   'current_state': Tetromino() => current state of level after applying tiles during game
///   'selected_tile': Tetromino() => current chosen tile to be applied, this tetromino can be manipulated by the player via action buttons (rotate, shift)
///   'tile_list': List[Tetromino] => list of all used tetromino tiles in the level
///   'counter_TetrominoI': {'initial': int, 'current': int} => map of initial number and current number of tetromino tile
///   'counter_TetrominoJ': {'initial': int, 'current': int} => map of initial number and current number of tetromino tile
///   'counter_TetrominoL': {'initial': int, 'current': int} => map of initial number and current number of tetromino tile
///   'counter_TetrominoO': {'initial': int, 'current': int} => map of initial number and current number of tetromino tile
///   'counter_TetrominoS': {'initial': int, 'current': int} => map of initial number and current number of tetromino tile
///   'counter_TetrominoZ': {'initial': int, 'current': int} => map of initial number and current number of tetromino tile
///   'counter_TetrominoT': {'initial': int, 'current': int} => map of initial number and current number of tetromino tile
/// }
class LevelState extends MapBase {
  final Map<String, dynamic> lvlstate;

  LevelState({Map<String, dynamic>? initialMap})
      : lvlstate = initialMap != null
            ? Map.from(initialMap)
            : {
                'initial_state': Tetromino(),
                'tile_list': [],
                'current_state': Tetromino(),
                'selected_tile': Tetromino(),
                'counter_TetrominoI': {'initial': 0, 'current': 0},
                'counter_TetrominoJ': {'initial': 0, 'current': 0},
                'counter_TetrominoL': {'initial': 0, 'current': 0},
                'counter_TetrominoO': {'initial': 0, 'current': 0},
                'counter_TetrominoS': {'initial': 0, 'current': 0},
                'counter_TetrominoZ': {'initial': 0, 'current': 0},
                'counter_TetrominoT': {'initial': 0, 'current': 0},
              };

  LevelState initLevelState() {
    /// Create initial level state from empty level state to initialized state to returned.
    /// Function returning initialized state from given inputState
    LevelState initLevel = StateManagement.generateNewLevelstate();
    log("[initLevelState] initLevel : $initLevel");

    return initLevel;
  }

  LevelState clone() {
    Map<String, dynamic> newMap = {};

    lvlstate.forEach((key, value) {
      if (value is Tetromino) {
        // DeepCopy für Tetromino
        newMap[key] = value.copy();
      } else if (value is Map) {
        // DeepCopy für Counter-Maps (initial, current)
        newMap[key] = Map<String, dynamic>.from(value);
      } else if (value is List) {
        // DeepCopy für Listen
        newMap[key] = List.from(value);
      } else {
        // Primitive Typen (Strings, ints, bools) sind immutable und können direkt kopiert werden
        newMap[key] = value;
      }
    });
    return LevelState(initialMap: newMap);
  }

  @override
  operator [](Object? key) {
    return lvlstate[key];
  }

  @override
  void operator []=(key, value) {
    lvlstate[key] = value;
  }

  @override
  void clear() {
    clear();
  }

  @override
  Iterable<dynamic> get keys => lvlstate.keys;

  @override
  remove(Object? key) {
    lvlstate.remove(key);
  }

  /// This method applies the currently selected tile of a given state to the current state
  /// Input is an entire levelstate object from which the needed objects are extracted
  static LevelState applyState(LevelState inputState) {
    Tetromino currentState = inputState['current_state'];
    Tetromino selectedTile = inputState['selected_tile'];

    /// Apply or subtracting should only be possible if selected tiles number do not become negative
    if (GridOperations.gridsubtractionAllowed(
        gridA: currentState, gridB: selectedTile)) {
      /// Subtract chosen tetromino from current state and set as new state
      inputState['current_state'] = GridOperations.subtractGrids(
          gridA: currentState, gridB: selectedTile);

      /// Update tetromino counter after application if not already zero
      if (inputState['counter_${selectedTile.runtimeType}'] != null && inputState['counter_${selectedTile.runtimeType}']['current'] > 0) {
        inputState['counter_${selectedTile.runtimeType}']['current'] -= 1;
      }

      /// Clear the selected tile
      inputState['selected_tile'] = Tetromino();

      log("[applyState] Returned state : $inputState");
      return inputState;
    } else {
      log("[applyState] Apply not possible");
      return inputState;
    }
  }

  /// This method reverts the state from the list of state in the history
  static LevelState revertState(List<LevelState> inputHistory) {
    /// return last element from history list if list is not empty, otherwise do nothing
    if (inputHistory.isNotEmpty) {
      log("[revertState] inputHistory = $inputHistory");
      return inputHistory.last;
    } else {
      log("[revertState] inputHistory empty");
      return LevelState();
    }
  }

  /// This method resets the entire level state to the initial state
  static LevelState resetState(LevelState inputState) {
    inputState['current_state'] = inputState['initial_state'];
    inputState['selected_tile'] = Tetromino();
    inputState['counter_TetrominoI']['current'] =
        inputState['counter_TetrominoI']['initial'];
    inputState['counter_TetrominoJ']['current'] =
        inputState['counter_TetrominoJ']['initial'];
    inputState['counter_TetrominoL']['current'] =
        inputState['counter_TetrominoL']['initial'];
    inputState['counter_TetrominoO']['current'] =
        inputState['counter_TetrominoO']['initial'];
    inputState['counter_TetrominoS']['current'] =
        inputState['counter_TetrominoS']['initial'];
    inputState['counter_TetrominoZ']['current'] =
        inputState['counter_TetrominoZ']['initial'];
    inputState['counter_TetrominoT']['current'] =
        inputState['counter_TetrominoT']['initial'];

    log("[resetState] State reset to : $inputState");
    return inputState;
  }
}
