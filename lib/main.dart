import 'package:chat_talk/screens/chat_screen.dart';
import 'package:chat_talk/screens/login_screen.dart';
import 'package:chat_talk/screens/registration_screen.dart';
import 'package:chat_talk/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          headlineLarge: TextStyle(color: Colors.black54),
        ),
      ),
      initialRoute: WelcomeScreen.route,
      routes: {
        WelcomeScreen.route : (context) => WelcomeScreen(),
        LoginScreen.route : (context) => LoginScreen(),
        RegistrationScreen.route : (context) => RegistrationScreen(),
        ChatScreen.route : (context) => ChatScreen(),
      },
    );
  }
}
