import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Comman/routes.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/custom_button.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/custom_field.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/password_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController shopNameController = TextEditingController();
  final TextEditingController shopAddressController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: kBGColor,
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kTransparentColor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kTransparentColor,
            surfaceTintColor: kTransparentColor,
            // centerTitle: true,
            // title: const Text(
            //   "SIGN UP",
            //   style: TextStyle(
            //     fontSize: 17,
            //     fontWeight: FontWeight.w600,
            //     color: kBlackColor,
            //     fontFamily: kFontFamily,
            //   ),
            // ),
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    kSize15,
                    const Text(
                      "Let's get started",
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
                        "create your new account and grow your buisness",
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
                      controller: shopNameController,
                      hintText: 'Enter your shop name',
                      keyboardType: TextInputType.name,
                    ),
                    kSize15,
                    CustomTextField(
                      controller: shopAddressController,
                      hintText: 'Enter your shop address',
                    ),
                    kSize15,
                    CustomTextField(
                      controller: phoneController,
                      hintText: 'Enter your phone number',
                      keyboardType: TextInputType.name,
                    ),
                    kSize15,
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
                    kSize15,
                    CustomTextField(
                      controller: usernameController,
                      hintText: 'Enter your username',
                      keyboardType: TextInputType.name,
                    ),
                    kSize30,
                    CustomButton(
                      onTap: () {},
                      buttonName: 'Sign Up',
                      buttonColor: kButtonColor,
                    ),
                    kSize15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 17,
                            color: Colors.black,
                            fontFamily: kFontFamily,
                          ),
                        ),
                        const SizedBox(width: 7),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.signin);
                          },
                          child: const Text(
                            "Sign In",
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: kFontFamily,
                              color: Color.fromARGB(255, 0, 59, 107),
                            ),
                          ),
                        ),
                      ],
                    ),
                    kSize15,
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
