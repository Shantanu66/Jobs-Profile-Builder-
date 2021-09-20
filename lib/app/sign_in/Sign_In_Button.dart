import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class SignInButton extends CustomElevatedButton {
  SignInButton({
    String text,
    Color Buttoncolor,
    Color textcolor,
    double BorderRadius,
    VoidCallback onPressed,
    double Height
  }): super(
    child:Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
          color: textcolor,
          fontSize: 18.0,
          fontWeight: FontWeight.w500),
    ),
    color1: textcolor,
    color2: Buttoncolor,
    bordorRadius: BorderRadius,
    onPressed: onPressed,
    height:Height
  );
}