import 'package:flutter/material.dart';

/// Colors and UI related settings
const Color borderColorCurrentSelection = Colors.deepOrange;
const double borderWidthCurrentSelection = 5;
const Color iconColor = Color.fromARGB(255, 80, 80, 80);
const Color iconColorHighlight = Color.fromARGB(255, 240, 240, 240);

/// [numberColors]
/// 
/// Here the coloring of the single digits of the square field are defined.
/// The higher the digit, the darker the color.
Map<int, Color> numberColors = {
  0: Colors.white,
  1: Colors.blueGrey.shade200,
  2: Colors.blueGrey.shade300,
  3: Colors.blueGrey.shade400,
  4: Colors.blueGrey.shade500,
  5: Colors.blueGrey.shade600,
  6: Colors.blueGrey.shade700,
  7: Colors.blueGrey.shade800,
  8: Colors.blueGrey.shade900,
  9: Colors.black,
};

Color getNumberColors(int number) {
  return numberColors[number] ?? Colors.transparent;
}