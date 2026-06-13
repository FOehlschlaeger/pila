import 'package:flutter/material.dart';
import 'package:pila/config/colors.dart';
import 'package:pila/config/dialogtext_feedback.dart';

class HomeFeedbackDialog extends StatelessWidget {
  const HomeFeedbackDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.feedback, // Icons.code, // Icons.feedback,
        color: iconColor,
      ),
      highlightColor: iconColorHighlight,
      onPressed: () {
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return FeedbackDialog();
          }
        );
      },
      iconSize: 35,
    );
  }
}
