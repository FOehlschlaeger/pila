import 'package:flutter/material.dart';
import 'package:pila/utils/clickable_text_url.dart';

class FeedbackDialog extends StatelessWidget {
  const FeedbackDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Feedback",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
              ),
              const Text(
                "Did you find a bug, do you wish some feature to be implemented or do you have feedback in general?\n",
              ),
              const Text(
                "Please, let me know via the",
              ),
              const ClickableTextUrl(
                text: "Github Issues of this project\n", 
                url: "https://github.com/FOehlschlaeger/pila/issues",
              ),
              const Text(
                "Development",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                )
              ),
              const Text(
                "This app is based on Dart and Flutter.",
              ),
              const ClickableTextUrl(
                text: "The source code is available on GitHub\n", 
                url: "https://github.com/FOehlschlaeger/pila",
              ),
            ],
          ),
        )
      ],
    );
  }
}