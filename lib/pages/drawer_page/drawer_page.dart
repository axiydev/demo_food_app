import 'package:demo_app/models/list_tile_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerPage extends StatefulWidget {
  static final String id="drawer_page";
  static Widget screen()=>DrawerPage();

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  List? lt=[
    LTileMod(str:"Profile", widget:Icon(Icons.account_circle_outlined,color:Colors.white,)),
    LTileMod(str:"orders", widget:Icon(Icons.add_shopping_cart_sharp,color:Colors.white,)),
    LTileMod(str:"offer and promo", widget:Icon(Icons.local_offer_outlined,color:Colors.white,)),
    LTileMod(str:"Privacy policy", widget:Icon(Icons.article_outlined,color:Colors.white,)),
    LTileMod(str:"Security", widget:Icon(Icons.security,color:Colors.white,)),
  ];
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFFA4A0C),
      body: SafeArea(
          child: Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.only(left: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child:ListView.separated(
                    itemCount:lt!.length,
                    shrinkWrap: true,
                    itemBuilder:(context,index)=>ListTile(
                      minLeadingWidth: 10,
                      isThreeLine: false,
                      contentPadding: EdgeInsets.all(0),
                      leading: lt![index].widgetInfo,
                      title: Text(lt![index].strInfo.toString(),
                        style:GoogleFonts.rubik(
                            fontSize: 18,
                            color: Colors.white
                        ),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(
                        indent: size.width*0.1,
                        thickness: 1,
                        color: Colors.white,
                        endIndent: size.width*0.53,
                      );
                    },
                  ),
                ),
                Container(
                  width: size.width*0.3,
                  padding: EdgeInsets.only(left: 10),
                  child:ListTile(
                    contentPadding: EdgeInsets.all(0),
                    isThreeLine: false,
                    title: Text("SignOut",
                      style:GoogleFonts.rubik(
                          fontSize: 18,
                          color: Colors.white
                      ),
                    ),
                    trailing: Icon(Icons.arrow_forward,color: Colors.white,),
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}