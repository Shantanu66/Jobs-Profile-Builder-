import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

class SocialSignInButton extends CustomElevatedButton {
  SocialSignInButton(
      {
      @required String text,
      @required String logo,
      Color Buttoncolor,
      Color textcolor,
      double BorderRadius,
      VoidCallback onPressed,
      double Height})
      : assert(text!=null,logo!=null),
        super(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(logo),
                Text(
                  text,
                  style: TextStyle(
                      color: textcolor,
                      fontSize: 18.0,
                      fontWeight: FontWeight.w500),
                ),
                Opacity(
                  child: Image.asset(logo),
                  opacity: 0.0,
                ),
              ],
            ),
            color1: textcolor,
            color2: Buttoncolor,
            bordorRadius: BorderRadius,
            onPressed: onPressed,
            height: Height);
}
