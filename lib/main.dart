import 'package:flutter/material.dart';
import 'package:pila/screens/home_actions.dart';
import 'package:pila/screens/home_grid.dart';
import 'package:pila/screens/home_reload.dart';
import 'package:pila/screens/home_tetrominos.dart';
import 'screens/home_appbar.dart';
import 'screens/home_menu.dart';

void main() {
  runApp(const Pila());
}

class Pila extends StatelessWidget {
  const Pila({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pila',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PilaHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class PilaHome extends StatelessWidget {
  const PilaHome({super.key});

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
