import 'package:flutter/material.dart';
import 'dart:math';

class GameGridScreen extends StatefulWidget {
  const GameGridScreen({super.key});

  @override
  State<GameGridScreen> createState() => _GameGridScreenState();
}

class _GameGridScreenState extends State<GameGridScreen> {
  // The state of the grid: A list of 16 numbers
  late List<int> _gridNumbers;
  final int _gridSize = 4; // 4x4 grid

  @override
  void initState() {
    super.initState();
    _initializeGrid();
  }

  // Initializes the grid with random numbers or a random state
  void _initializeGrid() {
    _gridNumbers = List.generate(
        _gridSize * _gridSize, (index) => Random().nextInt(8)); // number range
    // Optional: Setting a predefined state
    // _gridNumbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16];
  }

  // Method to change a number in the grid, if selected
  void _changeNumber(int index) {
    setState(() {
      // Example: INcrease the number by 1, or set a new random number
      _gridNumbers[index] = (_gridNumbers[index] + 1) %
          15; // Increase number or reset back to 0 at reaching 15
      // _gridNumbers[index] = Random().nextInt(100); // Or a new random number
    });
    // Here a complex game logic can be appied,
    // i.e. check, if an action is valid, giving points etc.
    print('Feld $index wurde geklickt. Neue Zahl: ${_gridNumbers[index]}');
  }

  // Helper method to reset the game
  void _resetGame() {
    setState(() {
      _initializeGrid();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Spiel zurückgesetzt!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*
      appBar: AppBar(
        title: const Text(
          'Zahlenraster-Spiel',
          // style: TextStyle(color: Colors.white)
        ),
        // backgroundColor: Colors.deepPurple, // Passend zum Theme
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: _resetGame,
            tooltip: 'Spiel zurücksetzen',
          ),
        ],
      ),
      */
      body: Container(
        decoration:  const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 155, 182, 212),
              Color.fromARGB(255, 255, 255, 255)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: AspectRatio(
              aspectRatio: 1, // square grid
              child: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 190, 190, 190).withOpacity(0.1), // slighty transparency
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(
                      color: const Color.fromARGB(255, 70, 70, 70).withOpacity(0.3), width: 2),
                ),
                child: GridView.builder(
                  padding: const EdgeInsets.all(8.0),
                  itemCount: _gridSize * _gridSize, // 16 fields
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: _gridSize, // 4 columns
                    crossAxisSpacing: 8.0, // distance between columns
                    mainAxisSpacing: 8.0, // distance between rows
                  ),
                  itemBuilder: (context, index) {
                    // Jedes Feld ist ein GestureDetector, um Klicks zu erkennen
                    return GestureDetector(
                      onTap: () =>
                          _changeNumber(index), // Ruft die Logik bei Klick auf
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.blueGrey.shade700
                              .withOpacity(0.8), // Hintergrundfarbe des Feldes
                          borderRadius: BorderRadius.circular(8.0),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 1,
                              blurRadius: 3,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          '${_gridNumbers[index]}', // Zeigt die aktuelle Zahl an
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
      ),
    );
  }
}
