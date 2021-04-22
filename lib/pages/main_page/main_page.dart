
import 'package:demo_app/pages/drawer_page/drawer_page.dart';
import 'package:demo_app/pages/home_page/home_page.dart';
import 'package:demo_app/pages/main_page/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget{
  static final String id="main_page";
  static Widget screen()=>ChangeNotifierProvider<MainProvider>(
    create:(context)=>MainProvider(),
    child: MainPage(),
  );

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage>{
  @override
  Widget build(BuildContext context){
    final provider=Provider.of<MainProvider>(context);
    final Size size =MediaQuery.of(context).size;
    return Consumer<MainProvider>(
      builder: (context,value,child)=>Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: Container(
            width:size.width,
            height: size.height,
            child: Stack(
              // ignore: deprecated_member_use
              overflow: Overflow.visible,
              children: [
                DrawerPage.screen(),
                HomePage.screen(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
// (){
// if(scaleAnimation?.value==1.0){
// value.changeBorderRadius(borderValue1: 25.0);
// controller?.forward();
// }else{
// value.changeBorderRadius(borderValue1:.0);
// controller?.reverse();
// }
// },


// Widget cont(BuildContext context,{xOffset,yOffset,scale,borderRadius}){
//   final Size size=MediaQuery.of(context).size;
//   return Transform(
//     transform:Matrix4.translationValues(xOffset, yOffset, 0),
//     child: Transform.scale(
//       scale: scale,
//       alignment:Alignment.topCenter,
//       child: Container(
//         height: size.height,
//         width: size.width,
//         decoration: BoxDecoration(
//             color: Colors.green,
//             borderRadius:borderRadius,
//             boxShadow: [
//               BoxShadow(offset: Offset(-30,30),color: Colors.red,blurRadius: 0),
//             ]
//         ),
//       ),
//     ),
//   );
// }
// Widget contone(BuildContext context){
//   final Size size=MediaQuery.of(context).size;
//   return Container(
//     height: size.height,
//     width: size.width,
//     color: Colors.blue,
//   );
// }

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