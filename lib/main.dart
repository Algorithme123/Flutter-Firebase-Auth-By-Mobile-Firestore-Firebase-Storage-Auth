import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobile_authentification/provider/auth_provider.dart';
import 'package:mobile_authentification/screens/welcome_screen.dart';
import 'package:provider/provider.dart';

void main()  async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=> AuthProvider()),
      ],

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Auth Numero telephonique',
        home: WelcomeScreen(),


      ),
    );
  }
}
