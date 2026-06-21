import 'package:flutter/material.dart';
import 'package:pila/screens/home_appbar.dart';
import 'package:pila/screens/home_body.dart';

/// [PilaHomeScreen]
/// 
/// Definition of the home screen splitted into appbar and body area
class PilaHomeScreen extends StatelessWidget {
  const PilaHomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// AppBar area
      appBar: PilaAppBar(),
    
      /// Central area
      body: PilaBody(),
    );
  }
}
