import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/Sign_In_Button.dart';


class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Center(child: Text('Time Tracker')), elevation: 13.0),
      //backgroundColor: Colors.deepPurple,
      body: _BuildContent(),
      backgroundColor: Colors.deepPurple[400],
    );
  }

  Widget _BuildContent() {
    return Container(
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w700,
              color: Colors.white,
              shadows: [
                Shadow(
                  offset: Offset(4.0, 4.0),
                  blurRadius: 20.0,
                  color: Color.fromARGB(150, 0, 0, 0),
                )
              ],
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
              text:'Sign In with Google',
            Buttoncolor: Colors.white,
            textcolor: Colors.black,
            BorderRadius: 18.0,
            onPressed: () {},
            Height:50.0
          ),
          SizedBox(
            height: 8.0,
          ),
        ],
      ),
    );
  }
}
