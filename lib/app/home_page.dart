import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key key,@required this.onsignout}) : super(key: key);
  final VoidCallback onsignout;


  Future<void> _SignOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      onsignout();
    }
    catch(e){
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Home Page'),
        actions: [
           TextButton(
             child:Text('Log Out',
             style: TextStyle(
               color: Colors.white,
               fontSize: 18.0
             ),
             ),
             onPressed: _SignOut,
           )
        ],

      ),
    );
  }
}
