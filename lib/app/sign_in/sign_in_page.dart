import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/Sign_In_Button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/common_widgets/custom_raised_button.dart';

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
            height: 48.0,
          ),
          SocialSignInButton(
            text:'Sign In with Google',
            logo: 'images/google-logo.png',
            textcolor: Colors.black,
            Buttoncolor: Colors.white,
            BorderRadius: 18.0,
            Height: 50.0,
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
            text:'Sign In with Facebook',
            logo: 'images/facebook-logo.png',
            textcolor: Colors.white,
            Buttoncolor: Color(0xFF334D92),
            BorderRadius: 18.0,
            Height: 50.0,
            onPressed: () {},
          ),
          SizedBox(
            height: 8.0,
          ),
          SocialSignInButton(
              text:'Sign In with Email',
              logo: 'images/email-logo.png',
              Buttoncolor: Colors.teal[800],
              textcolor: Colors.white,
              BorderRadius: 18.0,
              onPressed: () {},
              Height: 50.0),
          SizedBox(
            height: 8.0,
          ),
          Text(
            'or',
            style: TextStyle(
              fontSize: 17.0,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 8.0,
          ),
          SignInButton(
              text: 'Sign In as Guest',
              Buttoncolor: Colors.lime[600],
              textcolor: Colors.white,
              BorderRadius: 18.0,
              onPressed: () {},
              Height: 50.0),
          //Image.asset('images/google-logo.png'),
        ],
      ),
    );
  }
}
