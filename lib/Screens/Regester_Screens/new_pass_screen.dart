import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';
import 'package:jewellery/Comman/padding_and_size.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/custom_button.dart';
import 'package:jewellery/Screens/Regester_Screens/Comman/password_field.dart';

class ChangeNewPassword extends StatefulWidget {
  const ChangeNewPassword({super.key});

  @override
  State<ChangeNewPassword> createState() => _ChangeNewPasswordState();
}

class _ChangeNewPasswordState extends State<ChangeNewPassword> {
  final TextEditingController passController = TextEditingController();
  final TextEditingController rePassController = TextEditingController();

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
              child: Center(
                child: Column(
                  children: [
                    kSize15,
                    const Text(
                      "Create new password",
                      style: TextStyle(
                        fontSize: 28,
                        color: Color.fromARGB(255, 58, 5, 67),
                        fontWeight: FontWeight.bold,
                        fontFamily: kFontFamily,
                      ),
                    ),
                    kSize30,
                    PasswordField(
                      controller: passController,
                      hintText: 'Enter new password',
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    kSize15,
                    PasswordField(
                      controller: rePassController,
                      hintText: 'Re enter new password',
                      keyboardType: TextInputType.visiblePassword,
                    ),
                    kSize30,
                    CustomButton(
                      onTap: () {},
                      buttonName: 'Change Password',
                      buttonColor: kButtonColor,
                    ),
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
