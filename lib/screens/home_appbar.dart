import 'package:flutter/material.dart';
import 'package:pila/screens/home_feedback.dart';
import 'package:pila/screens/home_help.dart';

/// [PilaAppBar]
///
/// Appbar area with app icon and dialog icons
/// - help dialog
/// - feedback dialog
///
/// Maybe further options might be added here in the future such as:
/// - language settings
/// - light mode / dark mode
/// - general settings
///
/// But: To avoid visually button overload maybe a drawer will be needed.
class PilaAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PilaAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      /// App Icon
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Image.asset(
            'assets/images/icon/pila-icon_and_name_orange_2.png',
            height: 35,
          ),
        ],
      ),

      /// Icon Dialogs
      centerTitle: true,
      actions: [
        HomeHelpDialog(),
        HomeFeedbackDialog(),
      ],

      /// AppBar design
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 148, 148, 148),
              Color.fromARGB(255, 255, 255, 255),
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
