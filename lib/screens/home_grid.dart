import 'package:flutter/material.dart';

import 'package:pila/config/colors.dart';
import 'package:pila/functions/grid_operations.dart';
import 'package:pila/functions/tetromino_operations.dart' as tetrominoOperations;
import 'package:pila/models/level_state.dart';
import 'package:pila/models/tetromino.dart';

class GameGridScreen extends StatefulWidget {
  const GameGridScreen({super.key});

  @override
  State<GameGridScreen> createState() => _GameGridScreenState();
}

class _GameGridScreenState extends State<GameGridScreen> {
  late LevelState currentState = LevelState();
  late List<LevelState> levelStateHistory = [];
  int get _gridColumns => currentState['initial_state'].length;
  int get _gridRows => currentState['initial_state'][0].length;
  var gridOperations = GridOperations();

  Offset? _lastTriggerPos;

  // Wie viele Pixel muss der Finger wandern, um einen "Schritt" auszulösen?
  // Kleinerer Wert = Höhere Sensibilität (häufigere Aufrufe)
  final double _threshold = 30.0;

  void _handleDragUpdate(Offset currentPos) {
    if (_lastTriggerPos == null) {
      _lastTriggerPos = currentPos;
      return;
    }

    // Berechne die Differenz zum letzten Trigger-Punkt
    double dx = currentPos.dx - _lastTriggerPos!.dx;
    double dy = currentPos.dy - _lastTriggerPos!.dy;

    // Prüfen, ob die horizontale oder vertikale Bewegung die Schwelle überschreitet
    if (dx.abs() >= _threshold) {
      if (dx > 0) {
        _gestureShiftRight(currentState);
      } else {
        _gestureShiftLeft(currentState);
      }
      // WICHTIG: Den Referenzpunkt aktualisieren
      _lastTriggerPos = currentPos;
    } else if (dy.abs() >= _threshold) {
      if (dy > 0) {
        _gestureShiftDown(currentState);
      } else {
        _gestureShiftUp(currentState);
      }
      // WICHTIG: Den Referenzpunkt aktualisieren
      _lastTriggerPos = currentPos;
    }
  }

  @override
  void initState() {
    super.initState();
    currentState = currentState.initLevelState();
    levelStateHistory = [];
  }

  // Helper method to reset the game
  void _resetGame(LevelState lvlstate, List<LevelState> levelStateHistory) {
    setState(() {
      // initState();
      // currentState = currentState.initLevelState();
      currentState = LevelState.resetState(lvlstate);
      levelStateHistory = [];
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(duration: Duration(milliseconds: 500), content: Text('Level is reset!')),
    );
  }

  void _undoLastApply(LevelState lvlstate, List<LevelState> levelStateHistory) {
    setState(() {
      // currentState = LevelState.revertState(levelStateHistory);
      if (levelStateHistory.isNotEmpty) {
        print("[_undoLastApply] currentState : $currentState");
        print("[_undoLastApply] levelStateHistory : $levelStateHistory");
        currentState = levelStateHistory.last;
        levelStateHistory.removeLast();
        print("[_undoLastApply] currentState : $currentState");
        print("[_undoLastApply] levelStateHistory : $levelStateHistory");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(duration: Duration(milliseconds: 500), content: Text('_undoLastApply: undo previous apply')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(duration: Duration(milliseconds: 500), content: Text('_undoLastApply: nothing to revert')),
        );
      }
    });
  }

  void _applyTetromino(
      LevelState lvlstate, List<LevelState> levelStateHistory) {
    setState(() {
      Tetromino prevState = lvlstate['current_state'];
      print("[_applyTetromino] levelStateHistory before : $levelStateHistory");
      // add current state to state history as independent copy before applying
      LevelState cloneCurrentLevelState = lvlstate.clone();
      levelStateHistory.add(cloneCurrentLevelState);
      print("[_applyTetromino] levelStateHistory after : $levelStateHistory");
      lvlstate = LevelState.applyState(lvlstate);
      if (prevState == lvlstate['current_state']) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              duration: Duration(milliseconds: 500), content: Text('_applyTetromino: Apply not possible, at least one field is already cleared! ')),
        );
      }

      // check if state is clear after apply operation
      if (GridOperations.stageClear(lvlstate['current_state'])) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              duration: Duration(milliseconds: 500), content: Text('_applyTetromino: level state cleared! ')),
        );
      }
    });
  }

  void _rotateTetromino(LevelState lvlstate) {
    print("_rotateTetromino: rotate selected tetromino");
    setState(() {
      lvlstate['selected_tile'] =
          tetrominoOperations.rotate<Tetromino>(lvlstate['selected_tile']);
    });
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(duration: Duration(milliseconds: 500), content: Text('"_rotateTetromino: rotate selected tetromino')),
    // );
  }

  void _gestureShiftUp(LevelState lvlstate) {
    print("_gestureShiftUp: shift selected tetromino upwards");
    setState(() {
      lvlstate['selected_tile'] =
          tetrominoOperations.shiftUp<Tetromino>(lvlstate['selected_tile']);
      print("_gestureShiftUp: $lvlstate");
    });
  }

  void _gestureShiftDown(LevelState lvlstate) {
    print("_gestureShiftDown: shift selected tetromino downwards");
    setState(() {
      lvlstate['selected_tile'] =
          tetrominoOperations.shiftDown<Tetromino>(lvlstate['selected_tile']);
      print("_gestureShiftDown: $lvlstate");
    });
  }

  void _gestureShiftLeft(LevelState lvlstate) {
    print("_gestureShiftLeft: shift selected tetromino left");
    setState(() {
      lvlstate['selected_tile'] =
          tetrominoOperations.shiftLeft<Tetromino>(lvlstate['selected_tile']);
      print("_gestureShiftLeft: $lvlstate");
    });
  }

  void _gestureShiftRight(LevelState lvlstate) {
    print("_gestureShiftRight: shift selected tetromino right");
    setState(() {
      lvlstate['selected_tile'] =
          tetrominoOperations.shiftRight<Tetromino>(lvlstate['selected_tile']);
      print("_gestureShiftRight: $lvlstate");
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanStart: (details) {
        // Startpunkt setzen
        _lastTriggerPos = details.localPosition;
      },
      onPanUpdate: (details) {
        // Logik bei jeder Fingerbewegung prüfen
        _handleDragUpdate(details.localPosition);
      },
      onPanEnd: (_) {
        // Reset beim Loslassen
        _lastTriggerPos = null;
      },
      child: Scaffold(
        backgroundColor: Colors.white.withValues(alpha: 0.0),
        body: Column(
          children: [
            Expanded(
              flex: 8,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: AspectRatio(
                  aspectRatio: 1, // square grid
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
                        crossAxisSpacing: 8.0, // distance between columns
                        mainAxisSpacing: 8.0, // distance between rows
                      ),
                      itemBuilder: (context, index) {
                        int indexRow = (index / _gridRows).floor();
                        int indexColumn = index % _gridColumns;

                        // print("INDEX: $index");
                        // List<int> currentStateIndex = currentState['current_state'][indexRow];
                        // print(currentStateIndex);
                        int currentIndex = currentState["current_state"]
                            [indexRow][indexColumn];
                        // print(currentIndex);

                        // Each field is a GestureDetector, to recognize clicks
                        return GestureDetector(
                          // onVerticalDragDown: () => _resetGame(),
                          onDoubleTap: () =>
                              // _changeNumber(index), // Calls logic at click
                              // _resetGame(index),
                              _applyTetromino(currentState, levelStateHistory),
                          child: Container(
                            decoration: BoxDecoration(
                              color: getNumberColors(
                                  currentIndex), // Background color of the field
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
            // TetrominoButtons
            Expanded(
              flex: 4,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 14.0),
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
            // ActionButtons
            Expanded(
              flex: 3,
              child: Container(
                // alignment: Alignment.center,
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
                            onPressed: (() => _undoLastApply(currentState, levelStateHistory)),
                            onLongPress: (() =>
                                _resetGame(currentState, levelStateHistory)),
                            iconSize: 60,
                            color: Color.fromARGB(255, 80, 80, 80),
                            highlightColor: Color.fromARGB(255, 240, 240, 240)),
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
                            color: Color.fromARGB(255, 80, 80, 80),
                            highlightColor: Color.fromARGB(255, 240, 240, 240)),
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
                            color: Color.fromARGB(255, 80, 80, 80),
                            highlightColor: Color.fromARGB(255, 240, 240, 240)),
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
    );
  }

  Widget _buildImageWithNumber(
      String imagePath, LevelState lvlstate, Tetromino selectedTetromino) {
    final String key = 'counter_${selectedTetromino.runtimeType}';
    final int number = lvlstate[key]?['current'] ?? 0;

    bool isSelected = false;
    Color selectionColor = Colors.transparent;
    // bool isSelected = lvlstate['selected_tile'] == selectedTetromino;
    print("isSelected: $isSelected");
    bool hasZeroCounter = lvlstate[key]['initial'] == 0 || number == 0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        onTap: () {
          if (!hasZeroCounter) {
            print("Klick auf: ${selectedTetromino.runtimeType}");
            lvlstate['selected_tile'] = selectedTetromino;

            isSelected = lvlstate['selected_tile'] == selectedTetromino;
            print("isSelected onTap: $isSelected");
            print(
                "_buildImageWithNumber: lvlstate_selected_tile: ${lvlstate['selected_tile']}");
            print(
                "_buildImageWithNumber: lvlstate_selectedtetromino: $selectedTetromino");
            setState(() {
              lvlstate['selected_tile'] = selectedTetromino;
              selectionColor = Color.fromARGB(255, 0, 255, 13);
            });

            print(
                "Neues selected_tile: ${lvlstate['selected_tile'].runtimeType}");
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: hasZeroCounter
                ? const Color.fromARGB(6, 150, 150, 150) // Color.fromARGB(255, 175, 77, 77).withValues(alpha: 0.2)
                : borderColorCurrentSelection.withValues(alpha: 0.4),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              // color: const Color.fromARGB(255, 0, 255, 13),
              color: isSelected ? selectionColor : Colors.transparent,
              width: 2,
            ),
          ),
          padding: const EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize
                .min, // Verhindert, dass die Row den ganzen Platz einnimmt
            children: [
              Text(
                "${number}x",
                style: TextStyle(
                  // color: isSelected ? Colors.white : const Color.fromARGB(255, 70, 70, 70),
                  color: Colors.white,
                  fontSize: 20,
                  // fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
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
