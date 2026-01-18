/// General tetromino class.
/// Each tetromino is a 2d array with columns and rows given from defaults.
library;

import 'dart:collection';

import '/config/defaults.dart';

class Tetromino with ListMixin<List<int>> {
  // 1. Instanzvariable: Deklariert als final, da sie nach der Initialisierung
  //    nicht durch eine neue Liste ersetzt werden soll.
  final List<List<int>> _grid;

  // 2. Default-Konstruktor: Initialisiert die Matrix direkt beim Erstellen.
  //    Nutzt die standardmäßigen Konstanten.
  Tetromino([int rows = defaultRows, int columns = defaultColumns])
      : _grid = List.generate(
          rows, 
          (i) => List.filled(columns, 0) // 'List.filled' ist effizienter als List.generate für konstante Werte
        );

  // 3. Named Constructor: Erlaubt das Erstellen eines Tetromino-Objekts aus
  //    einer bestehenden Matrix.
  Tetromino.fromExistingGrid(List<List<int>> existingGrid) : _grid = existingGrid;

  // --- Implementierung der ListMixin-Methoden (Delegation an _grid) ---
  // Diese Methoden sind notwendig, wenn man ListMixin verwendet.

  // 4. Getter für die Länge
  @override
  int get length => _grid.length;

  // 5. Setter für die Länge (verwendet nur für die äußere Liste/Zeilen)
  @override
  set length(int newLength) {
    _grid.length = newLength;
  }

  // 6. Index-Operator (Lesen: Tetromino[i])
  @override
  List<int> operator [](int index) {
    return _grid[index];
  }

  // 7. Index-Operator (Schreiben: Tetromino[i] = [..])
  @override
  void operator []=(int index, List<int> value) {
    _grid[index] = value;
  }

  // --- Zusätzliche Methoden ---

  // 8. Methoden, die direkt auf der internen Liste operieren
  //    (Deine ursprüngliche 'add' Methode)
  void addRow(List<int> row) {
    _grid.add(row);
  }

  // 9. Getter für die Spaltengröße (wird aus der ersten Zeile abgeleitet)
  int get columnSize {
    if (_grid.isEmpty) return 0;
    return _grid.first.length;
  }
}

// Tetromino I
// [
//   [0, 0, 1, 0],
//   [0, 0, 1, 0],
//   [0, 0, 1, 0],
//   [0, 0, 1, 0]
// ]
class TetrominoI extends Tetromino {
  @override
  final List<List<int>> _grid;

  TetrominoI([int rows = defaultRows, int columns = defaultColumns])
      : _grid = [
        [0, 0, 1, 0],
        [0, 0, 1, 0],
        [0, 0, 1, 0],
        [0, 0, 1, 0],
      ];

  TetrominoI.fromExistingGrid(List<List<int>> existingGrid) : _grid = existingGrid;
}

// Tetromino J
// [
//   [0, 0, 1, 0],
//   [0, 0, 1, 0],
//   [0, 1, 1, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoJ extends Tetromino {
  @override
  final List<List<int>> _grid;

  TetrominoJ([int rows = defaultRows, int columns = defaultColumns])
      : _grid = [
        [0, 0, 1, 0],
        [0, 0, 1, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0],
      ];

  TetrominoJ.fromExistingGrid(List<List<int>> existingGrid) : _grid = existingGrid;
}

// Tetromino L
// [
//   [0, 1, 0, 0],
//   [0, 1, 0, 0],
//   [0, 1, 1, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoL extends Tetromino {
  @override
  final List<List<int>> _grid;

  TetrominoL([int rows = defaultRows, int columns = defaultColumns])
      : _grid = [
        [0, 1, 0, 0],
        [0, 1, 0, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0],
      ];

  TetrominoL.fromExistingGrid(List<List<int>> existingGrid) : _grid = existingGrid;
}

// Tetromino O
// [
//   [0, 0, 0, 0],
//   [0, 1, 1, 0],
//   [0, 1, 1, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoO extends Tetromino {
  @override
  final List<List<int>> _grid;

  TetrominoO([int rows = defaultRows, int columns = defaultColumns])
      : _grid = [
        [0, 0, 0, 0],
        [0, 1, 1, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0],
      ];

  TetrominoO.fromExistingGrid(List<List<int>> existingGrid) : _grid = existingGrid;
}

// Tetromino S
// [
//   [0, 0, 0, 0],
//   [0, 1, 1, 0],
//   [1, 1, 0, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoS extends Tetromino {
  @override
  final List<List<int>> _grid;

  TetrominoS([int rows = defaultRows, int columns = defaultColumns])
      : _grid = [
        [0, 0, 0, 0],
        [0, 1, 1, 0],
        [1, 1, 0, 0],
        [0, 0, 0, 0],
      ];

  TetrominoS.fromExistingGrid(List<List<int>> existingGrid) : _grid = existingGrid;
}

// Tetromino T
// [
//   [0, 0, 0, 0],
//   [1, 1, 1, 0],
//   [0, 1, 0, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoT extends Tetromino {
  @override
  final List<List<int>> _grid;

  TetrominoT([int rows = defaultRows, int columns = defaultColumns])
      : _grid = [
        [0, 0, 0, 0],
        [1, 1, 1, 0],
        [0, 1, 0, 0],
        [0, 0, 0, 0],
      ];

  TetrominoT.fromExistingGrid(List<List<int>> existingGrid) : _grid = existingGrid;
}

// Tetromino Z
// [
//   [0, 0, 0, 0],
//   [1, 1, 0, 0],
//   [0, 1, 1, 0],
//   [0, 0, 0, 0]
// ]
class TetrominoZ extends Tetromino {
  @override
  final List<List<int>> _grid;

  TetrominoZ([int rows = defaultRows, int columns = defaultColumns])
      : _grid = [
        [0, 0, 0, 0],
        [1, 1, 0, 0],
        [0, 1, 1, 0],
        [0, 0, 0, 0],
      ];

  TetrominoZ.fromExistingGrid(List<List<int>> existingGrid) : _grid = existingGrid;
}
