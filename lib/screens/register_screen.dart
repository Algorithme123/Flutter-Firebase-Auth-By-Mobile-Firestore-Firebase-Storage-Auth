import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 14.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 200,
                  height: 200,
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    shape : BoxShape.circle,
                    color: Colors.purple.shade50,

                  ),
                  child: Image.asset("assets/image2.png"),
                ),
                SizedBox(height: 20.0,),

                const Text(
                  " Registration",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black
                  ),
                ),
                const SizedBox(height: 10.0,),

                const Text(
                  " Add your phone number. We'll send you a \n verification CODE",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.black38,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20.0,),

                TextFormField(
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    hintText: "Entrer le Numero de Telephone",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: const BorderSide(color: Colors.black12),
                    ),
                    prefixIcon: Container(
                      padding: const EdgeInsets.all(8.0),
                    )
                  ) ,

                )






              ],
            ),
          ),
        )

      ),


    );
  }
}
