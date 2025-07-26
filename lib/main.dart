import 'package:flutter/material.dart';
import 'package:pila/screens/number_grid.dart';
import 'screens/appbar.dart';
import 'screens/burger_menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pila',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar-Bereich ---
      appBar: PilaAppBar(),

      // --- Settings drawer ---
      drawer: PilaDrawer(),

      // --- Zentraler Bereich (Body) ---
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 155, 182, 212),
              Color.fromARGB(255, 255, 255, 255),
              Color.fromARGB(255, 148, 148, 148)
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // Oberste Zeile: Zentraler Bereich
            Expanded(
              flex: 1, // Nimmt mehr Platz ein
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(4.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Reload for new level',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.0,
                      // fontWeight: FontWeight.bold,
                      // color: Colors.black87),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
                flex: 5,
                child: Center(
                  child: GameGridScreen(),
                  // child: const Text(
                  //    'Hier kommt das Grid hin') // GameGridScreen(),
                )),

            // Mittlere Zeile: Sieben Icons mit Zahlenfeldern (4 oben, 3 unten)
            Expanded(
              flex: 3, // Nimmt mehr Platz ein
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Obere Reihe der sieben Icons (4 Icons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildImageWithNumber(
                            'assets/images/tetromino-I.png', 3),
                        _buildImageWithNumber(
                            'assets/images/tetromino-O.png', 2),
                        _buildImageWithNumber(
                            'assets/images/tetromino-J.png', 1),
                        _buildImageWithNumber(
                            'assets/images/tetromino-L.png', 0),
                      ],
                    ),
                    // Untere Reihe der sieben Icons (3 Icons)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildImageWithNumber(
                            'assets/images/tetromino-S.png', 2),
                        _buildImageWithNumber(
                            'assets/images/tetromino-Z.png', 1),
                        _buildImageWithNumber(
                            'assets/images/tetromino-T.png', 2),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            // Unterste Zeile: Aktionen
            Expanded(
              flex: 2,
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
                          tooltip: "Revert last step, hold to reset",
                          onPressed: (() => {}),
                          iconSize: 60,
                          color: Color.fromARGB(255, 80, 80, 80),
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
                          onPressed: (() => {}),
                          iconSize: 60,
                          color: Color.fromARGB(255, 80, 80, 80),
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
                          onPressed: (() => {}),
                          iconSize: 60,
                          color: Color.fromARGB(255, 80, 80, 80),
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
            ),
          ],
        ),
      ),
    );
  }

  // Hilfsmethode zum Erstellen eines Bildes mit Zahlenfeld
  Widget _buildImageWithNumber(String imagePath, int number) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          // decoration: BoxDecoration(
          //   color: const Color.fromARGB(255, 110, 110, 110),
          //   borderRadius: BorderRadius.circular(15),
          // ),
          child: Text(
            "${number}x",
            style: const TextStyle(
                color: Color.fromARGB(255, 70, 70, 70), fontSize: 20),
          ),
        ),
        const SizedBox(height: 5), // Kleiner Abstand
        Image.asset(
          imagePath,
          width: 60,
          height: 60,
          fit: BoxFit.contain,
        ),
      ],
    );
  }
}
