import 'package:flutter/material.dart';
import 'package:jewellery/Comman/fonts.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String buttonName;
  final Color buttonColor;

  const CustomButton({
    super.key,
    required this.onTap,
    required this.buttonName,
    required this.buttonColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            buttonName,
            style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontFamily: kFontFamily,
            ),
          ),
        ),
      ),
    );
  }
}
