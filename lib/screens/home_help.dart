import 'package:flutter/material.dart';
import 'package:pila/config/colors.dart';
import 'package:pila/config/dialogtext_help.dart';

class HomeHelpDialog extends StatelessWidget {
  const HomeHelpDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.question_mark, // Icons.help_center,
        color: iconColor,
      ),
      highlightColor: iconColorHighlight,
      onPressed: () {
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return HelpDialog();
          }
        );
      },
      iconSize: 35,
    );
  }
}
