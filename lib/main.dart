import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pila/screens/home.dart';

void main() {
  // Keep orientation portaitUp if device orientation changes
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // Initialize application
  runApp(const Pila());
}

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

class PilaHome extends StatelessWidget {
  const PilaHome({super.key});

  @override
  Widget build(BuildContext context) {
    return PilaHomeScreen();
  }
}
