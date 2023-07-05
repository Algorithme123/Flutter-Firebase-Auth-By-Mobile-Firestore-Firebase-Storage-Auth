import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_authentification/screens/otp_screen.dart';
import 'package:mobile_authentification/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthProvider() {
    checkSignIn();
  }

  void checkSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();

    _isSignedIn = s.getBool("is_signedin") ?? false;
    notifyListeners();
  }

  void signInWithPhone(BuildContext context, String phoneNumber) async {
    try {
      phoneNumber : phoneNumber ;
      await _firebaseAuth.verifyPhoneNumber(
          verificationCompleted: (PhoneAuthCredential phoneAuthCredential) async{
            await _firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error){
            throw Exception(error.message);
          },
          codeSent: ((verificationId, forceResendingToken){
            
            Navigator.push(context, MaterialPageRoute(
                    builder: (context) => OtpScreen(verificationId: verificationId)
            ),

            );
          }),
          codeAutoRetrievalTimeout: (verificationId){});
    } on FirebaseAuthException catch (e) {
      showSnackBar(context, e.message.toString());
    }
  }
}
