import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
class LoginScreen extends StatefulWidget {
  static const String id="login_screen";
  static Widget screen()=>LoginScreen();
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Login"),
      ),
    );
  }
}
