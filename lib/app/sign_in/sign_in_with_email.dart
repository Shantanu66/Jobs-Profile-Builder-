import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sign_in_form_bloc_based.dart';
import 'package:time_tracker_flutter_course/app/sign_in/email_sign_in_form_stateful.dart';

class EmailSignInPage extends StatelessWidget {
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
              child: EmailSignInFormBlocBased.create(context),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              elevation: 25.0,
              color: Colors.white,

            ),
          ),
        ),
        backgroundColor: Colors.transparent.withOpacity(0),
      ),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.deepPurple[500],
                Colors.deepPurple[400],
                Colors.deepPurple[300],
              ]
          )
      ),
    );
  }
}
