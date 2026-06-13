import 'package:flutter/material.dart';
import 'package:pila/screens/home_appbar.dart';
import 'package:pila/screens/home_body.dart';
// import 'package:pila/screens/home_menu.dart';

class PilaHomeScreen extends StatelessWidget {
  const PilaHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // --- AppBar area ---
      appBar: PilaAppBar(),
    
      // --- Settings drawer ---
      // drawer: PilaDrawer(),
    
      // --- Central area (Body) ---
      body: PilaBody(),
    );
  }
}
