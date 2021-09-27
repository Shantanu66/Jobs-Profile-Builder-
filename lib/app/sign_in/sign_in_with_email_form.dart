import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_button/animated_button.dart';
import 'package:time_tracker_flutter_course/app/sign_in/validators.dart';
import 'package:time_tracker_flutter_course/services/auth.dart';

enum EmailSignInFormType { signIn, register }

class EmailSignInForm extends StatefulWidget with EmailAndPasswordValidators {
  EmailSignInForm({@required this.auth});

  final AuthBase auth;

  @override
  _EmailSignInFormState createState() => _EmailSignInFormState();
}

class _EmailSignInFormState extends State<EmailSignInForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String get _email => _emailController.text;

  String get _password => _passwordController.text;
  EmailSignInFormType _formType = EmailSignInFormType.signIn;
  bool _submitted = false;
  bool _isLoading = false;

  void _submit() async {
    //print('Submit called');
    setState(() {
      _submitted = true;
      _isLoading = true;
    });
    try {
      //await Future.delayed(Duration(seconds:3));
      if (_formType == EmailSignInFormType.signIn) {
        await widget.auth.signInWithEmailAndPassword(_email, _password);
      } else {
        await widget.auth.createUserWithEmailAndPassword(_email, _password);
      }
      Navigator.of(context).pop();
    } catch (e) {
      if (Platform.isIOS) {
        print('show CupertinoAlertDialog');
      }
      else {
        showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Sign In Failed'),
                content: Text(e.toString()),
                actions:
                [TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text('OK')
                )
                ],
              );
            });
      } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

    void _toggleFormType() {
    setState(() {
    _formType = _formType == EmailSignInFormType.signIn
    ? EmailSignInFormType.register
        : EmailSignInFormType.signIn;
    });
    _emailController.clear();
    _passwordController.clear();
    }

    List<Widget> _buildChildren() {
    final primarytext =
    _formType == EmailSignInFormType.signIn ? 'Sign In' : 'Create Acc';
    final secondarytext = _formType == EmailSignInFormType.signIn
    ? 'Need an Account?Register'
        : 'Have an Account?Sign In';

    bool submitEnabled = widget.emailValidator.isValid(_email) &&
    widget.passwordValidator.isValid(_password) &&
    !_isLoading;
    return [
    _buildEmailTextField(),
    SizedBox(
    height: 12.0,
    ),
    _buildPasswordTextField(),
    SizedBox(
    height: 30.0,
    ),
    AnimatedButton(
    child: Center(
    child: Text(
    primarytext,
    style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    ),
    ),
    ),
    color: Colors.deepPurple,
    shadowDegree: ShadowDegree.light,
    height: 43,
    width: 110,
    onPressed: submitEnabled ? _submit : null,
    enabled: _isLoading == false,
    ),
    SizedBox(
    height: 5.0,
    ),
    TextButton(
    child: Text(
    secondarytext,
    style: TextStyle(
    fontSize: 14,
    letterSpacing: 1,
    fontWeight: FontWeight.w500,
    color: Colors.black87),
    ),
    style: ButtonStyle(
    overlayColor: MaterialStateProperty.all(Colors.transparent)),
    onPressed: !_isLoading ? _toggleFormType : null,
    )
    ];
    }

    TextField _buildPasswordTextField() {
    bool showerrortext =
    _submitted && !widget.passwordValidator.isValid(_password);
    return TextField(
    controller: _passwordController,
    decoration: InputDecoration(
    labelText: 'Password',
    errorText: showerrortext ? widget.InvalidPasswordErrorText : null,
    enabled: _isLoading == false,
    ),
    obscureText: true,
    textInputAction: TextInputAction.done,
    );
    }

    TextField _buildEmailTextField() {
    bool showErrortext = _submitted && !widget.emailValidator.isValid(_email);
    return TextField(
    controller: _emailController,
    decoration: InputDecoration(
    labelText: 'Email',
    hintText: 'test@test.com',
    errorText: showErrortext ? widget.InvalidEmailErrorText : null,
    enabled: _isLoading == false,
    ),
    autocorrect: false,
    keyboardType: TextInputType.emailAddress,
    textInputAction: TextInputAction.next,
    );
    }

    @override
    Widget build(BuildContext context) {
    return Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: _buildChildren(),
    ),
    );
    }
  }
