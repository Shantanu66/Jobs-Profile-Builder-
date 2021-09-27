import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';

class EmailSignInForm extends StatelessWidget {
  List<Widget> _buildChildren() {
    return [
      TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          hintText: 'test@test.com',
        ),
      ),
      SizedBox(
        height: 12.0,
      ),
      TextField(
        decoration: InputDecoration(
          labelText: 'Password',
        ),
        obscureText: true,
      ),
      SizedBox(
        height: 30.0,
      ),
      AnimatedButton(
        child: Text(
          'Sign In',
          style: TextStyle(color: Colors.white,
              fontWeight: FontWeight.bold),
        ),
        color: Colors.deepPurple,
        shadowDegree: ShadowDegree.light,
        height: 43,
        width: 110,
        onPressed: () {},
      ),
      SizedBox(
        height: 5.0,
      ),
      TextButton(
        child: Text(
          'Need an Account?Register',
          style: TextStyle(
              fontSize: 14,
              letterSpacing: 1,
              fontWeight: FontWeight.w500,
              color: Colors.black87),
        ),
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.transparent)),
        onPressed: () {},
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: _buildChildren(),
      ),
    );
  }
}
