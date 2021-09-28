import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/Sign_In_Button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_with_email.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:time_tracker_flutter_course/services/auth_provider.dart';

class SignInPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title:Center(child: Text('Time Tracker')),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.deepPurple[600],
                      Colors.deepPurple[200],
                    ],
                  ),
                ),
              )
              ,elevation: 10.0),
      //backgroundColor: Colors.deepPurple,
      body: _BuildContent(context),
    );
  }
  const SignInPage({Key key,@required this.auth}) :
        super(key: key);
  final AuthBase auth;

  Future<void> _SignInAnonymously(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signInAnonymously();
    }
    catch(e){
      print(e.toString());
    }
  }

  Future<void> _SignInwithGoogle(BuildContext context) async {
    try {
      final auth = AuthProvider.of(context);
      await auth.signInWithGoogle();
    }
    catch(e){
      print(e.toString());
    }
  }
  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(auth: auth,),
      ),
    );
  }

  Widget _BuildContent(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Sign In',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 35.0,
              fontWeight: FontWeight.w900,
              color: Colors.black,
              shadows: [
                Shadow(
                  offset: Offset(3.0, 3.0),
                  blurRadius: 15.0,
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
            onPressed:()=> _SignInwithGoogle(context),
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
              onPressed: () => _signInWithEmail(context),
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
              Buttoncolor: Colors.lime,
              textcolor: Colors.black,
              BorderRadius: 18.0,
              onPressed:()=> _SignInAnonymously(context),
              Height: 50.0),
          //Image.asset('images/google-logo.png'),
        ],
      ),
    );
  }
}
