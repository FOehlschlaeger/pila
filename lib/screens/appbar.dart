import 'package:flutter/material.dart';

class PilaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PilaAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.menu, color: Color.fromARGB(255, 80, 80, 80)),
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        iconSize: 35,
      ),
      title: Image.asset(
        'assets/images/pila-icon.png',
        height: 45,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.help_outline,
              color: Color.fromARGB(255, 80, 80, 80)),
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Hilfe-Icon geklickt!')),
            );
          },
          iconSize: 35,
        ),
      ],
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
