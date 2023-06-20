import 'package:chit_chat/screens/registration.dart';
import 'package:flutter/material.dart';
import 'login.dart';
import 'package:chit_chat/screens/login.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chit_chat/resuable_button.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'WelcomeScreen';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  Animation? animation;
  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    super.initState();
    controller?.forward();
    animation = CurvedAnimation(parent: controller!, curve: Curves.decelerate);
    animation =
        ColorTween(begin: Colors.pink, end: Colors.cyan).animate(controller!);
    controller?.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: animation?.value,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 60.0,
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                      'Flash Chat',
                      textStyle: const TextStyle(
                          fontSize: 45.0, fontWeight: FontWeight.w900),
                    )
                  ],
                ),
              ]),
              SizedBox(
                height: 48.0,
              ),
              reuseable_buttons(
                  colour: Colors.lightBlueAccent,
                  text: Text(
                    'log in',
                    style: TextStyle(color: Colors.white),
                  ),
                  onpress: () {
                    Navigator.pushNamed(context, LoginScreen.id);
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
              reuseable_buttons(
                  colour: Colors.blueAccent,
                  text: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                  onpress: () {
                    Navigator.pushReplacementNamed(
                        context, RegistrationScreen.id);
                  })
            ],
          ),
        ));
  }
}
