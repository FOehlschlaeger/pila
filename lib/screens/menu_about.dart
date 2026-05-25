import 'package:flutter/material.dart';
import 'package:pila/utils/clickable_text_url.dart';

class MenuAboutScreen extends StatelessWidget {
  const MenuAboutScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('About'),
      onTap: () {
        Navigator.pop(context);
        showDialog(
          context: context, 
          builder: (BuildContext context) {
            return SimpleDialog(
              title: const Text("About this app"),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "This app is developed using Dart and the Flutter framework.\n",
                      ),
                      Text(
                        "The source code is available on GitHub:\n",
                      ),
                      const ClickableTextUrl(
                        text: "github.com/FOehlschlaeger/pila", 
                        url: "https://github.com/FOehlschlaeger/pila",
                      ),
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
