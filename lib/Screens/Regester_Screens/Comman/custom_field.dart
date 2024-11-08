import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType keyboardType;

  const CustomTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(13.0),
        border: Border.all(
          color: kBoarderColor,
        ),
      ),
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          border: InputBorder.none,
          hintStyle: const TextStyle(
            color: Colors.black87,
            fontFamily: kFontFamily,
            fontSize: 17,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 15,
          ),
        ),
        style: const TextStyle(
          fontSize: 18,
          fontFamily: kFontFamily,
        ),
      ),
    );
  }
}
