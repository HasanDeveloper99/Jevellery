import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  const PasswordField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType});

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isPasswordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.0),
        border: Border.all(
          color: kBoarderColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.controller,
              keyboardType: widget.keyboardType,
              obscureText: !_isPasswordVisible,
              decoration: InputDecoration(
                hintText: widget.hintText,
                border: InputBorder.none,
                hintStyle: const TextStyle(
                  color: Colors.black87,
                  fontFamily: kFontFamily,
                  fontSize: 17,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 15,
                ),
                // suffixIcon: IconButton(
                //   icon: Icon(
                //     _isPasswordVisible
                //         ? Icons.visibility
                //         : Icons.visibility_off,
                //   ),
                //   onPressed: () {
                //     setState(() {
                //       _isPasswordVisible = !_isPasswordVisible;
                //     });
                //   },
                // ),
              ),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              },
              child: Container(
                child: _isPasswordVisible
                    ? Icon(Icons.visibility)
                    : Icon(Icons.visibility_off),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
