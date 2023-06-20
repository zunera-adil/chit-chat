import 'package:chit_chat/screens/constraints.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chit_chat/resuable_button.dart';

import 'chat.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'LoginScreen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flexible(
              child: Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: kTextFieldDecoration.copyWith(
                hintText: 'Enter your email',
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
                obscureText: true,
                onChanged: (value) {
                  password = value;
                  //Do something with the user input.
                },
                decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Enter your password.')),
            SizedBox(
              height: 24.0,
            ),
            reuseable_buttons(
                colour: Colors.lightBlueAccent,
                text: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
                onpress: () async {
                  try {
                    final user = await _auth
                        .signInWithEmailAndPassword(
                            email: email.toString(),
                            password: password.toString())
                        .then((userCredential) {
                      Navigator.pushNamed(context, ChatScreen.id);
                    }).catchError((error) {
                      print(error);
                    });
                  } catch (e) {}
                })
          ],
        ),
      ),
    );
  }
}
