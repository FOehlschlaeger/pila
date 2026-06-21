import 'package:flutter/material.dart';

/// [HelpDialog]
/// 
/// Dialog showing the help page providing basic information on how to play.
class HelpDialog extends StatelessWidget {
  const HelpDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      title: const Text(
        "How to play",
        style: TextStyle(
          fontWeight: FontWeight.bold,
        )
      ),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "In this game you have to reduce the digits in the grid down to zero (white field).\n",
              ),
              const Text(
                "To achieve this use the different Tetromino tiles below the grid. Each tile covers four fields in the grid.",
              ),
              const Text(
                "The digit of a field in the grid shows how many times this field is covered by a tile.\n",
              ),
              const Text(
                "If you apply the selected tile, each of the four fields covered by this tile is reduced by one.\n",
              ),
              const Text(
                "Each level consists of a specific set of Tetromino tiles. The number in front of the tile indicates how many times this tile is used.\n",
              ),
              const Text(
                "Move and Rotate:\nYou can move the selected tile by swiping horizontally or vertically in the button area (below the grid). You can rotate it using the Rotate button.\n",
              ),
              const Text(
                "Apply:\nReduce the marked fields covered by the selected tile.\n",
              ),
              const Text(
                "Revert:\nRevert the previous Apply. Hold this button to reset the entire level.\n",
              ),
              const Text(
                "New level:\nTo load a new level pull down the grid or finish the current level.",
              ),
            ],
          ),
        )
      ],
    );
  }
}