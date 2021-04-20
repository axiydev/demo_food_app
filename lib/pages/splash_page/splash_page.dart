import 'dart:async';

import 'package:demo_app/pages/login_page/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  static const String id = "splash_screen";

  static Widget screen() => SplashScreen();

  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  // void _timer(){
  //   Timer(Duration(seconds:3),()=>Navigator.pushReplacementNamed(context,LoginScreen.id));
  // }
  // @override
  // void initState(){
  //   super.initState();
  //   _timer();
  // }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/ic_background.jpg'),
              fit: BoxFit.cover,
            )
          ),
          child: Center(
            child: Container(
              height: size.width*0.5,
              width: size.width*0.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(width: 0.1,color: Colors.grey),
                boxShadow: [
                  BoxShadow(offset: Offset(0,10),color: Colors.grey[300]!,blurRadius: 20,spreadRadius: 5),
                ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
