

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_manager.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_with_email.dart';
import 'package:time_tracker_flutter_course/app/sign_in/social_sign_in_button.dart';
import 'package:time_tracker_flutter_course/common_widgets/show_exception_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
import 'package:simple_auth/simple_auth.dart' as simpleAuth;

class SignInPage extends StatelessWidget {
  const SignInPage({
    Key key,
    @required this.manager,
    @required this.isLoading,
  }) : super(key: key);
  final SignInManager manager;
  final bool isLoading;

  static Widget create(BuildContext context) {
    final auth = Provider.of<AuthBase>(context, listen: false);
    return ChangeNotifierProvider<ValueNotifier<bool>>(
      create: (_) => ValueNotifier<bool>(false),
      child: Consumer<ValueNotifier<bool>>(
        builder: (_, isLoading, __) => Provider<SignInManager>(
          create: (_) => SignInManager(auth: auth, isLoading: isLoading),
          child: Consumer<SignInManager>(
            builder: (_, manager, __) =>
                SignInPage(manager: manager, isLoading: isLoading.value),
          ),
        ),
      ),
    );
  }

  void _showSignInError(BuildContext context, Exception exception) {
    if (exception is FirebaseException &&
        exception.code == 'ERROR_ABORTED_BY_USER') {
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
      await manager.signInAnonymously();
    } on Exception catch (e) {
      _showSignInError(context, e);
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      await manager.signInWithGoogle();
    } on Exception catch (e) {
      _showSignInError(context, e);
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
  /*final simpleAuth.GithubApi githubApi = new simpleAuth.GithubApi(
      "github", "clientId", "clientSecret", "redirect:/",
      scopes: [
        "user",
        "repo",
        "public_repo",
      ]);
  void showError(dynamic ex) {
    showMessage(ex.toString());
  }

  void showMessage(String text) {
    var alert = new AlertDialog(content: new Text(text), actions: <Widget>[
      new TextButton(
          child: const Text("Ok"),
          onPressed: () {
            Navigator.pop(context);
          })
    ]);
    showDialog(context: context, builder: (BuildContext context) => alert);
  }

  void login(simpleAuth.AuthenticatedApi api) async {
    try {
      var success = await api.authenticate();
      showMessage("Logged in success: $success");
    } catch (e) {
      showError(e);
    }
  }
  void logout(simpleAuth.AuthenticatedApi api) async {
    await api.logOut();
    showMessage("Logged out");
  }*/
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
              onPressed: isLoading ? null : () => _signInWithGoogle(context),
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
              onPressed: isLoading ? null :()=>{}
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
                onPressed: isLoading ? null : () => _signInWithEmail(context),
                Height: 50.0),
            SizedBox(
              height: 8.0,
            ),
            SignInButton(
                text: 'Sign In as Guest',
                Buttoncolor: Colors.greenAccent,
                textcolor: Colors.black,
                BorderRadius: 18.0,
                onPressed: isLoading ? null : () => _signInAnonymously(context),
                Height: 50.0),
            //Image.asset('images/google-logo.png'),
          ],
        ),
      ),
    );
  }


  Widget _buildHeader() {
    if (isLoading) {
      return Center(
        child: CircularProgressIndicator(),
      );

    }
  }
}