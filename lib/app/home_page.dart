import 'package:flutter/material.dart';
import 'package:time_tracker_flutter_course/app/sign_in/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:time_tracker_flutter_course/common_widgets/show_alert_dialog.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

class HomePage extends StatelessWidget {

  const HomePage({Key key,@required this.auth}) :
        super(key: key);
  final AuthBase auth;


  Future<void> _SignOut() async {
    try {
      await auth.signOut();
    }
    catch(e){
      print(e.toString());
    }
  }
  Future<void> _confirmSignOut(BuildContext context) async{
    final didrequestSignOut=await showAlertDialog(
      context,
      title:'LogOut',
      content: 'Are you sure you want to Log Out?',
      cancelActionText: 'Cancel',
      defaultActionText: 'Logout',
    );
    if(didrequestSignOut==true){
      (_SignOut)();
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
             onPressed: ()=>_confirmSignOut(context),
           )
        ],

      ),
    );
  }
}
