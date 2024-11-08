import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Comman/routes.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/custom_button.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/custom_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
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
                    "Forgot Password",
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
                      "Enter your existing email address",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontFamily: kFontFamily,
                      ),
                    ),
                  ),
                  kSize30,
                  CustomTextField(
                    controller: emailController,
                    hintText: 'Enter your email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                  kSize30,
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.otpScreen);
                    },
                    buttonName: 'Send OTP',
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
