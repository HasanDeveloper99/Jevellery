import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Comman/routes.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/custom_button.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/custom_field.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/password_field.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
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
            automaticallyImplyLeading: false,
            backgroundColor: kTransparentColor,
            surfaceTintColor: kTransparentColor,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  kSize15,
                  const Text(
                    "Sign in here",
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
                      "Welcome back you have been missed",
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
                    hintText: 'Enter your email address',
                    keyboardType: TextInputType.name,
                  ),
                  kSize15,
                  PasswordField(
                    controller: passwordController,
                    hintText: 'Enter your password',
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  kSize10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.forgotPass);
                        },
                        child: const Text(
                          "Forgot your password?",
                          style: TextStyle(
                            fontSize: 17,
                            fontFamily: kFontFamily,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                  kSize30,
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.mainScreen);
                    },
                    buttonName: 'Sign In',
                    buttonColor: kButtonColor,
                  ),
                  kSize15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 17,
                          color: Colors.black,
                          fontFamily: kFontFamily,
                        ),
                      ),
                      const SizedBox(width: 7),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, AppRoutes.signUp);
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.blue,
                            fontFamily: kFontFamily,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
