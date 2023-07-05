import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({Key? key, required this.verificationId}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 35.0),
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: ()=>Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back),
                    ),
                ),
            Container(
              width: 200,
              height: 200,
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.purple.shade50,
              ),
              child: Image.asset("assets/image2.png"),
            ),
            SizedBox(
              height: 20.0,
            ),
            const Text(
              " Verification",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: Colors.black),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              " Saisir le code de Confirmation ",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black38,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20.0,
            ),
          ]),
        ),
      ),
    ));
  }
}
