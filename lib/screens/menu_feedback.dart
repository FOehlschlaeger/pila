import 'package:flutter/material.dart';
import 'package:pila/utils/clickable_text_url.dart';

class MenuFeedbackScreen extends StatelessWidget {
  const MenuFeedbackScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('Feedback'),
      onTap: () {
        Navigator.pop(context);
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text("Feedback"),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Have you found a bug or do you have features you wish to be added to the game?\n",
                      ),
                      const Text(
                        "Do you have other suggestions for the development of the game or feedback in general?\n",
                      ),
                      const Text(
                        "Please, let me know by using the\n",
                      ),
                      const ClickableTextUrl(
                        text: "Github Issues of this project", 
                        url: "https://github.com/FOehlschlaeger/pila/issues",
                      )
                    ],
                  ),
                )
              ],
            );
          }
        );
      },
    );
  }
}
