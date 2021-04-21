import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
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
      backgroundColor: Colors.grey,
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
                  border: Border.all(width: 0.5,color: Colors.grey),
                  boxShadow: [
                    BoxShadow(offset: Offset(0,5),color: Colors.grey[400]!,blurRadius: 10,spreadRadius:3),
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
                            myCustomWidget(context,isActive: true,text: "Login"),
                            myCustomWidget(context,isActive: false,text: "Sign-Up"),
                          ],
                        ),
                      )
                    ],
                  )
                )
              ),
              Container(
                width: size.width,
                height:  size.height*0.47,
                margin: EdgeInsets.only(top:size.width*0.15),
                padding:EdgeInsets.symmetric(horizontal: size.width*0.1),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: TextField(
                            style:GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: "Email address",
                              labelStyle: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              hintText: "example@gmail.com",
                              hintStyle:GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          child: TextField(
                            obscureText: true,
                            style:GoogleFonts.rubik(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                            decoration: InputDecoration(
                              floatingLabelBehavior: FloatingLabelBehavior.always,
                              labelText: "Password",
                              labelStyle: GoogleFonts.rubik(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                              hintText: "passcode",
                              hintStyle:  GoogleFonts.rubik(
                                fontWeight: FontWeight.w400,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        Container(
                          child:InkWell(
                            child:  Text("Forget passcode?",style:GoogleFonts.rubik(
                              fontWeight: FontWeight.w500,
                              fontSize: 16,
                              color: Color(0xFFFA4B0C),
                            ),),
                            onTap: (){
                              print('passcode');
                            },
                          )
                        ),
                      ],
                    ),
                    InkWell(
                      child: Container(
                          height: size.width*0.17,
                          width:double.infinity,
                          decoration: BoxDecoration(
                            borderRadius:BorderRadius.circular(size.width*0.18/2),
                            color: Color(0xFFFA4B0C),
                          ),
                          // ignore: deprecated_member_use
                          child:Center(
                            child: Text('Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white),),
                          )
                      ),
                      onTap: (){
                        print("PRESSED");
                      },
                    )
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
  Widget myCustomWidget(BuildContext context,{bool isActive=false,String? text}){
    final Size size =MediaQuery.of(context).size;
    return  Container(
      width: size.width*0.3,
      height: size.width*0.14,
      // ignore: deprecated_member_use
      child: FlatButton(
        child: Text(text!,style: TextStyle(fontSize: 17),),
        onPressed: (){},
      ),
      decoration: BoxDecoration(
          border: isActive?Border(bottom: BorderSide(width: 3,color: Colors.red)):Border(bottom: BorderSide(width: 3,color: Colors.white)),
      ),
    );
  }
}
