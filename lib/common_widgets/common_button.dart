import 'package:flutter/material.dart';
import 'package:stoke/core/utills/constants/color_constants.dart';

class CommonButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final double height;
  final double width;
  final TextStyle? textStyle;

  const CommonButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = ColorConstants.lightPrimaryColor,
    this.height = 55,
    this.width = double.infinity,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.circular(15), // Optional: Add border radius
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle ??
              const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
