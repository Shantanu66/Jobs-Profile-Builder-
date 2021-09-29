import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_with_email.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _isLoading = false;

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException && exception.code == 'ERROR_ABORTED_BY_USER') {
      return;
    }
    showExceptionAlertDialog(
      context,
      title: 'Sign in failed',
      exception: exception,
    );
  }

  Future<void> _signInAnonymously(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() => _isLoading = false);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() => _isLoading = true);
      final auth = Provider.of<AuthBase>(context, listen: false);
      await auth.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
    } finally {
      setState(() => _isLoading = false);
    }
  }


  void _signInWithEmail(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        fullscreenDialog: true,
        builder: (context) => EmailSignInPage(),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(title: Center(child: Text('Jobs Profiler')),
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
          , elevation: 10.0),
      //backgroundColor: Colors.deepPurple,
      body: _BuildContent(context),
    );
  }

  Widget _BuildContent(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
          begin: Alignment.topCenter,
          end:Alignment.center,
          colors: [
            Colors.deepPurple[500],
            Colors.deepPurple[300],
            Colors.deepPurple[200],
            Colors.deepPurple[100],
            Colors.deepPurple[50],
            Colors.white
          ]
        )
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 50.0,
              child: _buildHeader(),
            ),
            SizedBox(
              height: 48.0,
            ),
            SocialSignInButton(
              text: 'Sign In with Google',
              logo: 'images/google-logo.png',
              textcolor: Colors.black,
              Buttoncolor: Colors.white,
              BorderRadius: 18.0,
              Height: 50.0,
              onPressed: _isLoading ? null : () => _signInWithGoogle(context),
            ),
            SizedBox(
              height: 8.0,
            ),
            SocialSignInButton(
              text: 'Sign In with Github',
              logo: 'images/GitHub-Mark-Light-32px.png',
              textcolor: Colors.white,
              Buttoncolor: Colors.black87,
              BorderRadius: 18.0,
              Height: 50.0,
              onPressed: _isLoading ? null :()=> {},
            ),
            SizedBox(
              height: 8.0,
            ),
            SocialSignInButton(
                text: 'Sign In with Email',
                logo: 'images/email-logo.png',
                Buttoncolor: Colors.pink,
                textcolor: Colors.white,
                BorderRadius: 18.0,
                onPressed: _isLoading ? null : () => _signInWithEmail(context),
                Height: 50.0),
            SizedBox(
              height: 8.0,
            ),
            SignInButton(
                text: 'Sign In as Guest',
                Buttoncolor: Colors.greenAccent,
                textcolor: Colors.black,
                BorderRadius: 18.0,
                onPressed: _isLoading ? null : () => _signInAnonymously(context),
                Height: 50.0),
            //Image.asset('images/google-logo.png'),
          ],
        ),
      ),
    );
  }


  Widget _buildHeader() {
    if (_isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );

    }
  }
}