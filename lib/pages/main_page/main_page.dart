
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class MainPage extends StatefulWidget{
  static final String id="main_page";
  static Widget screen()=>MainPage();

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin{
  AnimationController? controller;
  Animation<double>? xAnimation;
  Animation<double>? yAnimation;
  Animation<double>? scaleAnimation;
  @override
  void initState(){
    super.initState();
    controller=AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
      reverseDuration: Duration(milliseconds: 600),
    );
    xAnimation=Tween<double>(begin: 0.0,end: 150.0).animate(CurvedAnimation(parent:controller!, curve:Curves.easeIn));
    yAnimation=Tween<double>(begin: 0.0,end: 150.0).animate(CurvedAnimation(parent:controller!, curve:Curves.easeIn));
    scaleAnimation=Tween<double>(begin: 1.0,end:0.6).animate(CurvedAnimation(parent:controller!, curve:Curves.easeIn));
  }
  @override
  void dispose(){
    super.dispose();
    controller?.dispose();
  }
  double? xOffxet=0;
  double? yOffset=0;
  double? scale=1;
  BorderRadius? borderRadius=BorderRadius.circular(0.0);
  @override
  Widget build(BuildContext context){
    final Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red,
      body: SafeArea(
        child: Container(
          width:size.width,
          height: size.height,
          child: Stack(
            children: [
              contone(context),
              AnimatedBuilder(
                  animation:xAnimation!,
                  builder:(context,child)=>AnimatedBuilder(
                    animation: yAnimation!,
                    builder: (context,child)=>AnimatedBuilder(
                      animation: scaleAnimation!,
                      builder:(context,child)=>InkWell(
                        child: cont(context,xOffset:xAnimation?.value,yOffset:yAnimation?.value,scale:scaleAnimation?.value,borderRadius: borderRadius),
                        onTap: (){
                          if(scaleAnimation?.value==1.0){
                            controller?.forward();
                            setState((){
                              borderRadius=BorderRadius.circular(20);
                            });
                          }else{
                            controller?.reverse();
                            setState(() {
                              borderRadius=BorderRadius.circular(.0);
                            });
                          }
                        },
                      ),
                    ),
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget cont(BuildContext context,{xOffset,yOffset,scale,borderRadius}){
  final Size size=MediaQuery.of(context).size;
  return Transform(
    transform:Matrix4.translationValues(xOffset, yOffset, 0),
    child: Transform.scale(
      scale: scale,
      alignment:Alignment.topCenter,
      child: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius:borderRadius,
            boxShadow: [
              BoxShadow(offset: Offset(-30,30),color: Colors.red,blurRadius: 0),
            ]
        ),
      ),
    ),
  );
}
Widget contone(BuildContext context){
  final Size size=MediaQuery.of(context).size;
  return Container(
    height: size.height,
    width: size.width,
    color: Colors.blue,
  );
}
// AnimatedContainer(
// transform: Matrix4.translationValues(xOffset, yOffset,0)..scale(scale),
// duration: Duration(milliseconds:600),
// curve: Curves.easeIn,
// height: size.height,
// width: size.width,
// decoration: BoxDecoration(
// color: Colors.green,
// borderRadius:borderRadius,
// boxShadow: [
// BoxShadow(offset: Offset(-30,30),color: Colors.red,blurRadius: 0),
// ]
// ),
// );