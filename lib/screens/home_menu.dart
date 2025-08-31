import 'package:flutter/material.dart';
import 'package:pila/utils/clickable_text_url.dart';

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
              'assets/images/pila-icon.png',
            ),
          ),
          ListTile(
            title: const Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: const Text("Settings"),
                    insetPadding: EdgeInsets.symmetric(),
                    children: <Widget>[
                      Text(
                        "Here some settings can be made. ",
                      )
                    ],
                  );
                }
              );
            },
          ),
          ListTile(
            title: const Text('Feedback'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: const Text("Feedback"),
                    insetPadding: EdgeInsets.symmetric(),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Have you found a bug or do you have features you wish to be added to the game?",
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                              "Do you have other suggestions for the development of the game or feedback in general?",
                              textAlign: TextAlign.left,
                            ),
                            const Text(
                              "\nPlease, let me know by using\n",
                              textAlign: TextAlign.left,
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
          ),
          ListTile(
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              showDialog(
                context: context, 
                builder: (BuildContext context) {
                  return SimpleDialog(
                    title: const Text("About this app"),
                    insetPadding: EdgeInsets.symmetric(),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "This app is developed using the Flutter framework.",
                            ),
                            Text(
                              "\nCurrent version of the app: ...",
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
              );
            },
          ),
        ]
      ),
    );
  }
}
