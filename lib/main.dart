import 'dart:async';

import 'package:demo_app/pages/login_page/login_page.dart';
import 'package:demo_app/pages/splash_page/splash_page.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());


class MyApp extends StatelessWidget {
  final futureWaitTime=Future.delayed(Duration(seconds: 10000000000));
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: futureWaitTime,
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return MaterialApp(
              home: SplashScreen.screen(),
              routes: {
                LoginScreen.id:(context)=>LoginScreen(),
              },
              debugShowCheckedModeBanner: false,
            );
          }
       return MaterialApp(
         title: 'Flutter Demo',
         theme: ThemeData(
           primarySwatch: Colors.blue,
         ),
         home:LoginScreen.screen(),
         debugShowCheckedModeBanner: false,
       );
      }
    );
  }
}
