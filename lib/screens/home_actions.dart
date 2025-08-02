import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                  highlightColor: Color.fromARGB(255, 240, 240, 240)
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
                  highlightColor: Color.fromARGB(255, 240, 240, 240)
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
                  highlightColor: Color.fromARGB(255, 240, 240, 240)
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
    );
  }
}
