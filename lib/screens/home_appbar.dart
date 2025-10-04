import 'package:flutter/material.dart';
import 'package:pila/screens/home_help.dart';

class PilaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PilaAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(

      // --- Menu ---
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Color.fromARGB(255, 80, 80, 80)),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        iconSize: 35,
      ),

      // --- App Icon ---
      title: Image.asset(
        'assets/images/pila-icon.png',
        height: 45,
      ),

      // --- Help ---
      centerTitle: true,
      actions: [
        HomeHelpDialog(),
      ],

      // --- AppBar design ---
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
