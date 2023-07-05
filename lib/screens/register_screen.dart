import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:mobile_authentification/provider/auth_provider.dart';
import 'package:mobile_authentification/widgets/custom_button.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneNumberController = TextEditingController();

  Country choixDuPays = Country(
      phoneCode: " 228",
      countryCode: "TG",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "TOGO",
      example: "TOGO",
      displayName: "Togo",
      displayNameNoCountryCode: "TG",
      e164Key: "");
  @override
  Widget build(BuildContext context) {
    phoneNumberController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneNumberController.text.length,
      ),
    );

    return Scaffold(
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                " Registration",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.black),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Text(
                " Add your phone number. We'll send you a \n verification CODE",
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
              TextFormField(
                cursorColor: Colors.purple,
                controller: phoneNumberController,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                onChanged: (value) {
                  setState(() {
                    phoneNumberController.text = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "Enter phone number",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    color: Colors.grey.shade600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.black12),
                  ),
                  prefixIcon: Container(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        showCountryPicker(
                            context: context,
                            countryListTheme: const CountryListThemeData(
                              bottomSheetHeight: 550,
                            ),
                            onSelect: (value) {
                              setState(() {
                                choixDuPays = value;
                              });
                            });
                      },
                      child: Text(
                        "${choixDuPays.flagEmoji} + ${choixDuPays.phoneCode}",
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  suffixIcon: phoneNumberController.text.length > 9
                      ? Container(
                    height: 30,
                    width: 30,
                    margin: const EdgeInsets.all(10.0),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                      size: 20,
                    ),
                  )
                      : null,
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: CustomButton(text: "Login", onPressed: ()=>sendPhoneNumber()),
              ),
            ],
          ),
        ),
      )),
    );

  }

  void sendPhoneNumber(){
    // +22893856735
    final ap=Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneNumberController.text.trim();
    ap.signInWithPhone(context, "+${choixDuPays.phoneCode}${phoneNumber}");

  }
}
