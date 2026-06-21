import 'package:flutter/material.dart';
import 'package:pila/screens/home_grid.dart';
import 'package:pila/screens/home_reload.dart';

/// [PilaBody]
/// 
/// This class describes the contents of the body of the main screen.
/// It consists basically of an reload area and the main area containing the grid and buttons.
class PilaBody extends StatelessWidget {
  const PilaBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
          /// Upper row: Reload information area
          ReloadArea(),
    
          /// Lower row: Area with grid, tetromino tiles and action buttons
          Expanded(
            flex: 10,
            child: Center(
              child: GameGridScreen(),
            )
          ),
        ],
      ),
    );
  }
}
