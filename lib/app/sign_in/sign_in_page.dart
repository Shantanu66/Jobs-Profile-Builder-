import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Center(child: Text('Time Tracker')), elevation: 15.0),
      //backgroundColor: Colors.deepPurple,
      body: _BuildContent(),
    );
  }

  Widget _BuildContent() {
    return Container(
      color: Colors.deepPurple,
      padding: EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Sign In',
            textAlign: TextAlign.center,
            style:TextStyle(fontSize: 32.0,fontWeight: FontWeight.w700,
                color: Colors.white,
                shadows: [Shadow(
                offset: Offset(4.0, 4.0),
                blurRadius: 20.0,
                color: Color.fromARGB(150, 0, 0, 0),
            )],
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            color: Colors.amber,
            child: SizedBox(
              height: 100.0,
            ),
          ),
          SizedBox(height: 8.0,),
          Container(
            color: Colors.green,
            child: SizedBox(
              height: 100.0,
            ),
          ),
          SizedBox(height: 8.0,),
        ],
      ),
    );
  }
}
