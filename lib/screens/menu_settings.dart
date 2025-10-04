import 'package:flutter/material.dart';

class MenuSettingsScreen extends StatelessWidget {
  const MenuSettingsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
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
    );
  }
}
