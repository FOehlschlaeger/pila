import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mein Flutter-Spiel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar-Bereich ---
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu,
              color: Colors.white), // Burger-Menü-Icon links
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Burger-Menü geklickt!')),
            );
          },
          iconSize: 35,
        ),
        title: Image.asset(
          'assets/images/pila-icon.png', // Dein Bildpfad hier
          height: 45, // Höhe des Bildes in der AppBar
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline,
                color: Colors.white), // Hilfe-Icon rechts
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Hilfe-Icon geklickt!')),
              );
            },
            iconSize: 35,
          ),
        ],
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 148, 148, 148),
                Color.fromARGB(255, 255, 255, 255),
                // Color.fromARGB(255, 148, 148, 148)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
      ),

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
              flex: 6, // Nimmt mehr Platz ein
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  margin: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: const Text(
                    'Willkommen zu meinem spannenden Spiel!\nBereit für das Abenteuer?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                ),
              ),
            ),

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
                        ),
                        Text('Revert | Reset'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.play_circle_fill),
                          tooltip: "Apply tetromino tile",
                          onPressed: (() => {}),
                          iconSize: 60,
                        ),
                        Text('Apply'),
                      ],
                    ),
                    Column(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.rotate_right),
                          tooltip: "Rotate by 90 degrees",
                          onPressed: (() => {}),
                          iconSize: 60,
                        ),
                        Text('Rotate'),
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
