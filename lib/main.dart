import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Pila());
}

class Pila extends StatelessWidget {
  const Pila({super.key});

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return MaterialApp(
      title: 'Pila Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(
            255, 139, 248, 50)),
        useMaterial3: true,
=======
    return ChangeNotifierProvider(
      create: (context) => PilaState(),
      child: MaterialApp(
        title: 'PILA',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        ),
        home: PilaHomePage(),
>>>>>>> 447d8a53ae9ba7c94258690298e48f0ebd02f8c5
      ),
    );
  }
}

class PilaState extends ChangeNotifier {
  var current = WordPair.random();
}

class PilaHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<PilaState>();

    return Scaffold(
      body: Column(
        children: [
          Text('A random idea:'),
          Text(appState.current.asLowerCase),
        ],
      ),
    );
  }
}
