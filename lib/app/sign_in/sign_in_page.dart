import 'package:flutter/material.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Center(child: Text('Time Tracker')), elevation: 15.0),
      //backgroundColor: Colors.deepPurple,
      body: BuildContent(),
    );
  }

  Container BuildContent() {
    return Container(
      color: Colors.deepPurple,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            color: Colors.pink,
            child: SizedBox(
              height: 100.0,
            ),
          ),
          Container(
            color: Colors.amber,
            child: SizedBox(
              height: 100.0,
            ),
          ),
          Container(
            color: Colors.green,
            child: SizedBox(
              height: 100.0,
            ),
          )
        ],
      ),
    );
  }
}
