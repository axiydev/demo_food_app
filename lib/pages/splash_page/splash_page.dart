import 'dart:async';

import 'package:demo_app/pages/login_page/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
          child:Center(
                child: Container(
                    height: size.width*0.65,
                    width: size.width*0.65,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(width: 0.1,color: Colors.grey),
                        boxShadow: [
                          BoxShadow(offset: Offset(0,10),color: Colors.grey[300]!,blurRadius: 20,spreadRadius: 5),
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                            Flexible(child: Container(
                              height: size.width*0.6,
                              width: size.width*0.6,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/images/ic_logo.png'),
                                    fit: BoxFit.cover,
                                  )
                              ),
                            ),),
                            Transform.translate(
                              offset: Offset(0,-size.width*0.18),
                              child:  Container(
                                child: Text("Food for everyone",style:GoogleFonts.rubik(fontSize:13,color: Color(0xFFFA4A0C))),
                            ),
                            ),
                            Transform.translate(
                            offset:Offset(0,-size.width*0.16),
                            child:
                                Container(
                                  margin: EdgeInsets.only(top:10),
                                  height: size.width*0.05,
                                  width: size.width*0.05,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
