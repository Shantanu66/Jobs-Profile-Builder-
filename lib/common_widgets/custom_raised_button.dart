import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton({
    this.child,
    this.color1,
    this.color2,
    this.bordorRadius,
    this.height,
    this.onPressed,
  }) :assert(bordorRadius!=null,height!=null);
  final Widget child;
  final Color color1;
  final Color color2;
  final double bordorRadius;
  final double height;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ElevatedButton(
        child: child,
        style: ElevatedButton.styleFrom(
          primary: color2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(bordorRadius),
          ),
          elevation: 4,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
