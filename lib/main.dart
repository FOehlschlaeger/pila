import 'package:flutter/material.dart';
import 'package:pila/screens/action_buttons.dart';
import 'package:pila/screens/number_grid.dart';
import 'package:pila/screens/reload_area.dart';
import 'package:pila/screens/tetromino_buttons.dart';
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
            ReloadArea(),

            Expanded(
                flex: 5,
                child: Center(
                  child: GameGridScreen(),
                )),

            // Mittlere Zeile: TetrominoButtons mit Zahlenfeldern (4 oben, 3 unten)
            TetrominoButtons(),

            // Unterste Zeile: ActionButtons
            action_buttons(),
          ],
        ),
      ),
    );
  }
}
