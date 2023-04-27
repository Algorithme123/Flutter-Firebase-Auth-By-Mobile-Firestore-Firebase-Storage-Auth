import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mobile_authentification/screens/register_screen.dart';

import '../widgets/custom_button.dart';

void main() => runApp(WelcomeScreen());

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical:25, horizontal: 35),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Image.asset("assets/image1.png",height : 300,),

                  const SizedBox(height: 20,),

                  const Text(
                    "commençons",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const Text(
                    "Ne perdons pas de temps",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black38,
                        fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20,),

                  SizedBox(width: double.infinity,
                    height: 50,
                    child: CustmonButton(
                      onPressed: (){
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context)=>RegisterScreen())
                            
                        );
                      },
                      text : "ON Comence",
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),


      ),
    );
  }
}
