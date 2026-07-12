import 'package:flutter/material.dart';

import 'package:pila/config/colors.dart';
import 'package:pila/config/defaults.dart';
import 'package:pila/functions/grid_operations.dart';
import 'package:pila/functions/tetromino_operations.dart'
    as tetrominoOperations;
import 'package:pila/models/level_state.dart';
import 'package:pila/models/tetromino.dart';

/// [GameGridScreen]
///
/// This class describes the main area in the UI with the grid, the tetromino tiles and the action buttons.
class GameGridScreen extends StatefulWidget {
  const GameGridScreen({super.key});

  @override
  State<GameGridScreen> createState() => _GameGridScreenState();
}

/// [_GameGridScreenState]
///
/// Manages the state of the grid during the game.
/// Provides the UI to the user including messages via Snackbars at the bottom screen.
class _GameGridScreenState extends State<GameGridScreen> {
  late LevelState currentState = LevelState();
  late List<LevelState> levelStateHistory = [];
  int get _gridColumns => currentState['initial_state'].length;
  int get _gridRows => currentState['initial_state'][0].length;
  var gridOperations = GridOperations();

  Offset? _lastTriggerPos;

  /// [_handleDragUpdate]
  ///
  /// Handler for shift-motion (horizontal / vertival) of selected tetromino in the grid.
  void _handleDragUpdate(Offset currentPos) {
    if (_lastTriggerPos == null) {
      _lastTriggerPos = currentPos;
      return;
    }

    /// Calculate difference to last trigger position
    double dx = currentPos.dx - _lastTriggerPos!.dx;
    double dy = currentPos.dy - _lastTriggerPos!.dy;

    /// Checking for horizontal or vertical motion crissing the resolution threshold
    if (dx.abs() >= threshold) {
      if (dx > 0) {
        _gestureShiftRight(currentState);
      } else {
        _gestureShiftLeft(currentState);
      }

      /// Important: Update the point of reference
      _lastTriggerPos = currentPos;
    } else if (dy.abs() >= threshold) {
      if (dy > 0) {
        _gestureShiftDown(currentState);
      } else {
        _gestureShiftUp(currentState);
      }

      /// Important: Update the point of reference
      _lastTriggerPos = currentPos;
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = currentState.initLevelState();
    levelStateHistory = [];
  }

  /// [createNewState]
  ///
  /// Initialize new level
  Future createNewState() async {
    setState(() {
      currentState = currentState.initLevelState();
      levelStateHistory = [];
    });

    /// Show context to user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text('New level created!')),
    );
  }

  /// [_resetGame]
  ///
  /// Helper method to reset the game
  void _resetGame(LevelState lvlstate, List<LevelState> levelStateHistory) {
    setState(() {
      currentState = LevelState.resetState(lvlstate);
      levelStateHistory = [];
    });

    /// Show context to user
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
          duration: Duration(milliseconds: 500),
          content: Text('Level is reset!')),
    );
  }

  /// [_undoLastApply]
  ///
  /// Method to revert the last apply action and revert the state of the grid and tetrominos
  /// Also checks if reverting is possible
  void _undoLastApply(LevelState lvlstate, List<LevelState> levelStateHistory) {
    setState(() {
      if (levelStateHistory.isNotEmpty) {
        currentState = levelStateHistory.last;
        levelStateHistory.removeLast();

        /// Show context to user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              duration: Duration(milliseconds: 500),
              content: Text('Undo previous apply')),
        );
      } else {
        /// Show context to user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              duration: Duration(milliseconds: 500),
              content: Text('Nothing to revert')),
        );
      }
    });
  }

  /// [_applyTetromino]
  ///
  /// Method to actually apply the selected tile to the current grid
  /// After each apply action the state is checked if level is finished
  /// Also the history of level states is used to enable a simple revert action
  void _applyTetromino(
      LevelState lvlstate, List<LevelState> levelStateHistory) {
    setState(() {
      Tetromino prevState = lvlstate['current_state'];

      /// Add current state to state history as independent copy before applying
      LevelState cloneCurrentLevelState = lvlstate.clone();
      levelStateHistory.add(cloneCurrentLevelState);

      lvlstate = LevelState.applyState(lvlstate);
      if (prevState == lvlstate['current_state']) {
        /// Show context to user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              duration: Duration(milliseconds: 500),
              content: Text(
                  'Apply not possible, at least one field is already cleared! ')),
        );
      }

      /// check if state is clear after apply operation
      if (GridOperations.tetrominoEmpty(lvlstate['current_state'])) {
        /// Show context to user
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              duration: Duration(milliseconds: 500),
              content: Text('Level state cleared! ')),
        );

        /// Show a dialog to the user to inform about finished game and to continue with new initialized level
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return SimpleDialog(
                  title: Center(
                    child: const Text("Congratulations!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: const Text(
                                "You have finished the level!\n",
                              ),
                            ),
                            Center(
                                child: ElevatedButton(
                              onPressed: () {
                                createNewState();
                                Navigator.pop(context);
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 3.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              child: const Text('Continue'),
                            ))
                          ],
                        ))
                  ]);
            });
      }
    });
  }

  /// [_rotateTetromino]
  ///
  /// Calling operation rotate and pass current levelstate
  void _rotateTetromino(LevelState lvlstate) {
    setState(() {
      lvlstate['selected_tile'] =
          tetrominoOperations.rotate<Tetromino>(lvlstate['selected_tile']);
    });
  }

  /// [_gestureShiftUp]
  ///
  /// Calling operation shiftUp and pass current levelstate
  void _gestureShiftUp(LevelState lvlstate) {
    setState(() {
      lvlstate['selected_tile'] =
          tetrominoOperations.shiftUp<Tetromino>(lvlstate['selected_tile']);
    });
  }

  /// [_gestureShiftDown]
  ///
  /// Calling operation shiftDown and pass current levelstate
  void _gestureShiftDown(LevelState lvlstate) {
    setState(() {
      lvlstate['selected_tile'] =
          tetrominoOperations.shiftDown<Tetromino>(lvlstate['selected_tile']);
    });
  }

  /// [_gestureShiftLeft]
  ///
  /// Calling operation shiftLeft and pass current levelstate
  void _gestureShiftLeft(LevelState lvlstate) {
    setState(() {
      lvlstate['selected_tile'] =
          tetrominoOperations.shiftLeft<Tetromino>(lvlstate['selected_tile']);
    });
  }

  /// [_gestureShiftRight]
  ///
  /// Calling operation shiftRight and pass current levelstate
  void _gestureShiftRight(LevelState lvlstate) {
    setState(() {
      lvlstate['selected_tile'] =
          tetrominoOperations.shiftRight<Tetromino>(lvlstate['selected_tile']);
    });
  }

  @override
  Widget build(BuildContext context) {
    /// Use GestureDetector to detect user shift actions
    return GestureDetector(
      onPanStart: (details) {
        /// Set starting point
        _lastTriggerPos = details.localPosition;
      },
      onPanUpdate: (details) {
        _handleDragUpdate(details.localPosition);
      },
      onPanEnd: (_) {
        _lastTriggerPos = null;
      },
      child: Scaffold(
        backgroundColor: Colors.white.withValues(alpha: 0.0),
        body: RefreshIndicator(
          onRefresh: () async {
            createNewState();
          },
          child: Column(
            children: [
              Expanded(
                flex: 8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 190, 190, 190)
                            .withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(
                            color: const Color.fromARGB(255, 70, 70, 70)
                                .withValues(alpha: 0.3),
                            width: 2),
                      ),
                      child: GridView.builder(
                        padding: const EdgeInsets.all(8.0),
                        itemCount: _gridColumns * _gridRows,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _gridRows,
                          // distance between columns
                          crossAxisSpacing: 8.0,

                          /// distance between rows
                          mainAxisSpacing: 8.0,
                        ),
                        itemBuilder: (context, index) {
                          int indexRow = (index / _gridRows).floor();
                          int indexColumn = index % _gridColumns;

                          int currentIndex = currentState["current_state"]
                              [indexRow][indexColumn];

                          return GestureDetector(
                            onDoubleTap: () => _applyTetromino(
                                currentState, levelStateHistory),
                            child: Container(
                              decoration: BoxDecoration(
                                color: getNumberColors(currentIndex),
                                border: Border.all(
                                  color: currentState["selected_tile"][indexRow]
                                              [indexColumn] ==
                                          1
                                      ? borderColorCurrentSelection
                                      : Colors.transparent,
                                  width: borderWidthCurrentSelection,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withValues(alpha: 0.3),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 2),
                                  ),
                                ],
                              ),
                              alignment: Alignment.center,
                              child: Text(
                                currentIndex.toString(),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),

              /// Area of TetrominoButtons
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 14.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildImageWithNumber('assets/images/tetromino-I.png',
                              currentState, TetrominoI()),
                          _buildImageWithNumber('assets/images/tetromino-O.png',
                              currentState, TetrominoO()),
                          _buildImageWithNumber('assets/images/tetromino-J.png',
                              currentState, TetrominoJ()),
                          _buildImageWithNumber('assets/images/tetromino-L.png',
                              currentState, TetrominoL()),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildImageWithNumber('assets/images/tetromino-S.png',
                              currentState, TetrominoS()),
                          _buildImageWithNumber('assets/images/tetromino-Z.png',
                              currentState, TetrominoZ()),
                          _buildImageWithNumber('assets/images/tetromino-T.png',
                              currentState, TetrominoT()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              // Area of ActionButtons
              Expanded(
                flex: 3,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color.fromARGB(255, 255, 255, 255),
                        Color.fromARGB(255, 148, 148, 148)
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.fast_rewind),
                            tooltip: "Revert last apply, hold to reset",
                            onPressed: (() => _undoLastApply(
                                currentState, levelStateHistory)),
                            onLongPress: (() =>
                                _resetGame(currentState, levelStateHistory)),
                            iconSize: 60,
                            color: iconColor,
                            highlightColor: iconColorHighlight,
                          ),
                          Text(
                            'Revert',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Hold to reset',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 10.0,
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.vertical_align_bottom),
                            tooltip: "Apply tetromino tile",
                            onPressed: (() => _applyTetromino(
                                currentState, levelStateHistory)),
                            iconSize: 60,
                            color: iconColor,
                            highlightColor: iconColorHighlight,
                          ),
                          Text(
                            'Apply',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.rotate_right),
                            tooltip: "Rotate by 90 degrees",
                            onPressed: (() => _rotateTetromino(currentState)),
                            iconSize: 60,
                            color: iconColor,
                            highlightColor: iconColorHighlight,
                          ),
                          Text(
                            'Rotate',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  /// [_buildImageWithNumber]
  ///
  /// Helper widget for the tetromino buttons including the counter in front
  Widget _buildImageWithNumber(
      String imagePath, LevelState lvlstate, Tetromino selectedTetromino) {
    final String key = 'counter_${selectedTetromino.runtimeType}';
    final int number = lvlstate[key]?['current'] ?? 0;

    final bool hasZeroCounter = lvlstate[key]['initial'] == 0 || number == 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: () {
          /// Check if tetromino tile is part of the level or not to colorize button
          if (!hasZeroCounter) {
            setState(() {
              lvlstate['selected_tile'] = selectedTetromino;
            });
          } else {
            setState(() {
              lvlstate['selected_tile'] = Tetromino();
            });
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: hasZeroCounter
                ? const Color.fromARGB(6, 150, 150, 150)
                : borderColorCurrentSelection.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: Colors.transparent,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "${number}x",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 5),
              Image.asset(
                imagePath,
                width: 50,
                height: 50,
                fit: BoxFit.contain,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
