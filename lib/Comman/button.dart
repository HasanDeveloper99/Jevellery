import 'package:flutter/material.dart';
import 'package:jewellery/Comman/colors.dart';
import 'package:jewellery/Comman/fonts.dart';

class CommanButton extends StatefulWidget {
  final double? height;
  final double? weight;
  final Color? buttonColor;
  final BorderRadius? borderRadius;
  final String buttonText;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final VoidCallback onTap;

  const CommanButton({
    super.key,
    this.height,
    this.weight,
    this.buttonColor,
    this.borderRadius,
    required this.buttonText,
    this.textColor,
    this.fontWeight,
    this.fontSize,
    required this.onTap,
  });

  @override
  State<CommanButton> createState() => _CommanButtonState();
}

class _CommanButtonState extends State<CommanButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: widget.height ?? 50,
        width: widget.weight ?? double.infinity,
        decoration: BoxDecoration(
          color: widget.buttonColor ?? kButtonColor,
          borderRadius: widget.borderRadius ?? BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            widget.buttonText,
            style: TextStyle(
              fontSize: widget.fontSize ?? 18,
              color: widget.textColor ?? kWhiteColor,
              fontFamily: kFontFamily,
              fontWeight: widget.fontWeight ?? FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
