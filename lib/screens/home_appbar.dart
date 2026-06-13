import 'package:flutter/material.dart';
import 'package:pila/screens/home_feedback.dart';
import 'package:pila/screens/home_help.dart';

class PilaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PilaAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      // --- Menu ---
      // leading: IconButton(
      //   icon: const Icon(Icons.menu, color: Color.fromARGB(255, 80, 80, 80)),
      //   onPressed: () {
      //     Scaffold.of(context).openDrawer();
      //   },
      //   iconSize: 35,
      // ),

      // --- App Icon ---
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Image.asset(
            'assets/images/pila-icon_and_name_orange_2.png',
            height: 35,
          ),
        ],
      ),

      // --- Icon Dialogs ---
      centerTitle: true,
      actions: [
        HomeHelpDialog(),
        HomeFeedbackDialog(),
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
