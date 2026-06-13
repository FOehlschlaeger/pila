import 'package:flutter/material.dart';

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
                "In this game you have to reduce all digits in the 4x4 grid down to zero (white fields).\n",
              ),
              const Text(
                "The 4x4 grid and Tetromino tiles",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
              ),
              const Text(
                "To achieve this use the seven different tetromino tiles below the grid. Each tile covers four digits (or fields) in the grid.",
              ),
              const Text(
                "If you apply one selected tile, the four covered digits in the grid are subtracted by one.\n",
              ),
              const Text(
                "Each level consists of a specific set of tetromino tiles. The number of each tile used is indicated by the number preceding it.\n",
              ),
              const Text(
                "Actions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
              ),
              const Text(
                "You can move and adjust the selected tile by swiping horizontally or vertically in the button area of the screen. You can also rotate it using the Rotate button.\n",
              ),
              const Text(
                "To apply the tile in the grid (subtract), use the Apply button.\n",
              ),
              const Text(
                "If you want to revert the last step, use the Revert button. Hold this button to reset the entire level.\n",
              ),
              const Text(
                "To load a new level just pull down the grid or clear the current level.",
              ),
            ],
          ),
        )
      ],
    );
  }
}