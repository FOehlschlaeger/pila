import 'package:flutter/material.dart';
import 'package:pila/screens/menu_about.dart';
import 'package:pila/screens/menu_feedback.dart';
import 'package:pila/screens/menu_settings.dart';

class PilaDrawer extends StatelessWidget {
  const PilaDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // Important: Remove any padding from the ListView.
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 148, 148, 148),
                  Color.fromARGB(255, 255, 255, 255),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Image.asset(
              'assets/images/pila-icon_minimal.png',
            ),
          ),

          // --- Settings screen in menu ---
          MenuSettingsScreen(),

          // --- Feedback screen in menu ---
          MenuFeedbackScreen(),

          // --- About screen in menu ---
          MenuAboutScreen(),
        ]
      ),
    );
  }
}
