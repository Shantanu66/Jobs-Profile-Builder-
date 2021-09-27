import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_with_email_form.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';
class EmailSignInPage extends StatelessWidget {
  EmailSignInPage({@required this.auth});
  final AuthBase auth;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Sign in'),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.deepPurple[600],
                  Colors.deepPurple[200],
                ],
              ),
            ),
          ),
          titleSpacing: 110.0,
          elevation: 15.0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Center(
            child: Card(
              child: EmailSignInForm(auth: auth),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              elevation: 20.0,

            ),
          ),
        ),
        backgroundColor: Colors.transparent.withOpacity(0),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.deepPurple[50],
                Colors.deepPurple[100],
                Colors.deepPurple[200],
                Colors.deepPurple[300],
                Colors.deepPurple[400],
                Colors.deepPurple[500],
                Colors.deepPurple[600]
              ]
          )
      ),
    );
  }
}
