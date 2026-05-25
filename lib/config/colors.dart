/*
Here the coloring of the single digits of the square field are defined.

The higher the digit, the darker the color.
 */
import 'package:flutter/material.dart';

const Color borderColorCurrentSelection = Colors.deepOrange;
const double borderWidthCurrentSelection = 5;

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