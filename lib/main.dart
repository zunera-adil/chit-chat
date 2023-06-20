import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:chit_chat/screens/welcome.dart';
import 'package:chit_chat/screens/login.dart';
import 'package:chit_chat/screens/registration.dart';
import 'package:chit_chat/screens/chat.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyA5CSRAupFK799ux1TfAQO2xKJhbrsmVl4',
      appId: '1:766640604327:android:9c4fcdc726f9e98ba48782',
      messagingSenderId: '766640604327',
      projectId: 'chit-chat-13399',
    ),
  );
  runApp(
    FlashChat(),
  );
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
    );
  }
}
