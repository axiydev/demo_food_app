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
    final Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body:Container(
        height: size.height,
        width: size.width,
        color: Color(0xFFF2F2F2),
        child: SingleChildScrollView(
          child:Column(
            children: [
              Container(
                height: size.width*0.8,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
                  color: Colors.white,
                  border: Border.all(width: 1,color: Colors.grey),
                  boxShadow: [
                    BoxShadow(offset: Offset(0,10),color: Colors.grey[500]!,blurRadius: 10,spreadRadius:3),
                  ],
                ),
                child:Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        height: size.width*0.4,
                        width: size.width*0.4,
                        // color: Colors.red,
                        child: FittedBox(
                          fit: BoxFit.cover,
                          child: Image(
                            image:AssetImage('assets/images/ic_login_logo1.png'),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      Container(
                        width: size.width,
                        padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                           Container(
                             width: size.width*0.3,
                             height: size.width*0.14,
                             // ignore: deprecated_member_use
                             child: FlatButton(
                               child: Text("Login",style: TextStyle(fontSize: 17),),
                               onPressed: (){},
                             ),
                             decoration: BoxDecoration(
                               border: Border(bottom: BorderSide(width: 3,color: Colors.red))
                             ),
                           ),
                            Container(
                              width: size.width*0.3,
                              height: size.width*0.14,
                              // ignore: deprecated_member_use
                              child: FlatButton(
                                child: Text("Sign-up",style: TextStyle(fontSize: 17),),
                                onPressed: (){},
                              ),
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 3,color: Colors.red))
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                )
              ),
            ],
          )
        ),
      ),
    );
  }
}
