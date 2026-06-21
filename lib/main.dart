import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pila/screens/home.dart';

/// Main function of the project
void main() {
  /// Keep orientation portaitUp if device orientation changes
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  /// Initialize application
  runApp(const Pila());
}

/// [Pila]
///
/// Create the app instance
class Pila extends StatelessWidget {
  const Pila({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pila',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const PilaHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}

/// [PilaHome]
///
/// Create the central home screen
class PilaHome extends StatelessWidget {
  const PilaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return PilaHomeScreen();
  }
}
