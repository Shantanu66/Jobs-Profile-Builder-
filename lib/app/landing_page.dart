import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/home_page.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class LandingPage extends StatefulWidget {

  final AuthBase auth;

  const LandingPage({Key key, @required this.auth}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  User _user;

  @override
  void initState() {
    _updateuser(widget.auth.currentUser);
    super.initState();
  }

  void _updateuser(User user) {
    setState(() {
      _user = user;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_user == null) {
      return SignInPage(
          auth: widget.auth,
          onSignIn: _updateuser);
    }
    return HomePage(
        auth: widget.auth,
        onsignout: ()=>
        _updateuser(null)
    ,
    );
  }
}
