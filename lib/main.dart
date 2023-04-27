import 'package:flutter/material.dart';
import 'package:mobile_authentification/screens/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Auth Numero telephonique',
      home: WelcomeScreen(),


    );
  }
}
