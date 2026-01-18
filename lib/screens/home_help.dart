import 'package:flutter/material.dart';

class HomeHelpDialog extends StatelessWidget {
  const HomeHelpDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.help_outline,
          color: Color.fromARGB(255, 80, 80, 80)),
      onPressed: () {
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text("How to play"),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "In this game you have to clear the level by reducing all digits down to zero in the 4x4 grid in the center of the screen.",
                      ),
                      const Text(
                        "\nTetromino tiles and 4x4 grid",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      const Text(
                        "You can achieve this by using the seven different tetromino tiles shown below the grid. Each tile covers four digits (fields) in the grid.",
                      ),
                      const Text(
                        "By applying one tile, the four selected digits in the grid are reduced by one.",
                      ),
                      const Text(
                        "\nEach level consists of a specific set of different tetromino tiles. The number of each tile used is indicated by the number in front of the tetromino button.",
                      ),
                      const Text(
                        "\nActions Buttons",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        )
                      ),
                      const Text(
                        "To move and adjust a tile in the grid swipe horizontally or vertically on the screen. You can also rotate the tile in the grid by using the Rotate button below the tetromino tile buttons.",
                      ),
                      const Text(
                        "\nTo apply a tile in the grid, just use the Apply button in the center at the bottom.",
                      ),
                      const Text(
                        "\nIf you want to revert the last applied tile, use the Revert button. Hold this button to reset the entire level.",
                      ),
                      const Text(
                        "\nTo load a new level just reload the screen or clear the current level.",
                      ),
                    ],
                  ),
                )
              ],
            );
          }
        );
      },
      iconSize: 35,
    );
  }
}
