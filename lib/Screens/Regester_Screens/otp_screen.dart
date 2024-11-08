import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Comman/routes.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/custom_button.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: kBGColor,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: kTransparentColor,
            surfaceTintColor: kTransparentColor,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kSize15,
                  const Text(
                    "Check your email",
                    style: TextStyle(
                      fontSize: 28,
                      color: Color.fromARGB(255, 58, 5, 67),
                      fontWeight: FontWeight.bold,
                      fontFamily: kFontFamily,
                    ),
                  ),
                  kSize10,
                  const Padding(
                    padding: kPadding20,
                    child: Text(
                      "We've sent the code to the email on your device",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: kFontFamily,
                      ),
                    ),
                  ),
                  kSize25,
                  Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13.0),
                      border: Border.all(
                        color: kBoarderColor,
                      ),
                    ),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      controller: otpController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Enter OTP',
                        border: InputBorder.none,
                        hintStyle: TextStyle(
                          color: Colors.black87,
                          fontFamily: kFontFamily,
                          fontSize: 17,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 15,
                        ),
                      ),
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                  kSize25,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Code expires in ",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontFamily: kFontFamily,
                        ),
                      ),
                      SizedBox(width: 7),
                      Text(
                        "00 : 30",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.blue,
                          fontFamily: kFontFamily,
                        ),
                      ),
                    ],
                  ),
                  kSize10,
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't recive code? ",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontFamily: kFontFamily,
                        ),
                      ),
                      SizedBox(width: 7),
                      Text(
                        "Resend Code",
                        style: TextStyle(
                          fontSize: 19,
                          color: Colors.blue,
                          fontFamily: kFontFamily,
                        ),
                      ),
                    ],
                  ),
                  kSize30,
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.changePassScreen);
                    },
                    buttonName: 'Verify',
                    buttonColor: kButtonColor,
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
