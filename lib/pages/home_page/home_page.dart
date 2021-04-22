import 'package:demo_app/pages/home_page/home_provider.dart';
import 'package:demo_app/pages/main_page/main_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  static const String id="home_page";
  static Widget screen()=>ChangeNotifierProvider<HomeProvider>(
    create:(context)=>HomeProvider(),
    child: HomePage(),
  );
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  AnimationController? controller;
  Animation<double>? xAnimation;
  Animation<double>? yAnimation;
  Animation<double>? scaleAnimation;
  List? listOne=[
    "Veggie tomato mix",
    "Egg and cucumber",
    "Fried chicken m.",
    "Moi-moi and ekpa",
    "Veggie tomato mix",
    "Egg and cucumber",
    "Fried chicken m.",
    "Moi-moi and ekpa",
    "Veggie tomato mix",
    "Egg and cucumber",
    "Fried chicken m.",
    "Moi-moi and ekpa",
    "Veggie tomato mix",
    "Egg and cucumber",
    "Fried chicken m.",
    "Moi-moi and ekpa",
  ];
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
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    final provider=Provider.of<HomeProvider>(context);
    return Consumer2<MainProvider,HomeProvider>(
      builder: (context,valueMain,valueHome,child)=>AnimatedBuilder(
          animation:xAnimation!,
          builder:(context,child)=>AnimatedBuilder(
            animation: yAnimation!,
            builder: (context,child)=>AnimatedBuilder(
              animation: scaleAnimation!,
              builder:(context,child)=>InkWell(
                  child:Transform(
                    transform:Matrix4.translationValues(xAnimation!.value, yAnimation!.value, 0),
                    child: Transform.scale(
                      scale: scaleAnimation!.value,
                      alignment:Alignment.topCenter,
                      child:Container(
                        height: size.height,
                        width: size.width,
                        padding: EdgeInsets.only(bottom: 23),
                        decoration: BoxDecoration(
                            color: Color(0xFFF4F4F8),
                            borderRadius:BorderRadius.circular(valueHome.borderValueInfo),
                            boxShadow: [
                              BoxShadow(offset: Offset(-35,35),color: Color(0xFFF4F4F8).withOpacity(0.3),blurRadius: 0),
                            ]
                        ),
                        child: Scaffold(
                          backgroundColor: Colors.transparent,
                          appBar: AppBar(
                            elevation: 0.0,
                            bottomOpacity: 0.0,
                            backgroundColor:Color(0xFFF4F4F8),
                            actions: [
                              IconButton(
                                onPressed: (){
                                },
                                icon:Icon(Icons.shopping_cart_outlined,color: Colors.black,)
                              ),
                              SizedBox(width: 30,),
                            ],
                            leading: Container(
                              padding: EdgeInsets.only(left: 33,),
                              child: Center(
                                child: InkWell(
                                  child:Icon(Icons.menu,color: Colors.black,),
                                  onTap: (){
                                    if(scaleAnimation?.value==1.0){
                                      valueHome.changeBorderRadius(borderValue1: 30.0);
                                      controller?.forward();
                                    }else{
                                      valueHome.changeBorderRadius(borderValue1:.0);
                                      controller?.reverse();
                                    }
                                  },
                                ),
                              )
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top:Radius.circular(valueHome.borderValueInfo))
                            ),
                          ),
                          body: SafeArea(
                            child: Container(
                              height: size.height,
                              width: size.width,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Container(
                                      width: size.width,
                                      padding:EdgeInsets.symmetric(horizontal:35),
                                      child: Text("Delicious\nfood for you",
                                        style: GoogleFonts.rubik(
                                          fontSize: 30,
                                          fontWeight: FontWeight.w600,
                                       ),
                                      ),
                                    ),
                                    SizedBox(height: 10,),
                                    //#textfield
                                    Container(
                                      height: size.width*0.14,
                                      width: double.infinity,
                                      padding: EdgeInsets.symmetric(horizontal: size.width*0.1),
                                      // color:Colors.red,
                                      child:Center(
                                        child: Container(
                                           height: size.width*0.13,
                                           width: double.infinity,
                                           padding: EdgeInsets.only(top:4,right: 10),
                                           decoration: BoxDecoration(
                                             color: Color(0xFFEFEEEE),
                                             borderRadius: BorderRadius.circular(size.width*0.9),
                                           ),
                                           child: TextField(
                                             decoration: InputDecoration(
                                               hintText: "Search",
                                               hintStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.w600),
                                               prefixIcon: IconButton(
                                                 icon: Icon(Icons.search),
                                                 onPressed:(){},
                                               ),
                                               border:InputBorder.none,
                                             ),
                                           ),
                                        )
                                      ),
                                    ),
                                    //#listview
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 20),
                                      width: size.width,
                                      alignment: Alignment.centerRight,
                                      child:TextButton(
                                        child: Text("see more",
                                          style: TextStyle(color: Color(0xFFFA4A0C)),
                                        ),
                                        onPressed: (){},
                                      ),
                                    ),
                                  //#listviev horizontal
                                    Container(
                                      height: size.height*0.4,
                                      padding: EdgeInsets.symmetric(vertical: 20),
                                      color: Colors.black,
                                      child:ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:listOne?.length,
                                          itemBuilder:(context,index)=>Card(
                                            color: Colors.orange,
                                            margin: EdgeInsets.only(left: 20),
                                            elevation: 10.0,
                                            child: Container(
                                              width: size.width*0.45,
                                              color: Colors.red,
                                              child:Container(
                                                child: Stack(
                                                  children: [

                                                    Container(
                                                      height:double.infinity,
                                                      width: double.infinity,
                                                      margin: EdgeInsets.only(top:40),
                                                      decoration: BoxDecoration(
                                                        borderRadius: BorderRadius.circular(25),
                                                        color: Colors.white,
                                                        border: Border.all(width: 1,color: Colors.grey)
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment: Alignment.topCenter,
                                                      child: Container(
                                                        height: size.width*0.3,
                                                        width: size.width*0.3,
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                          color: Colors.blue,
                                                          boxShadow: [
                                                            BoxShadow(color: Colors.grey,offset: Offset(0,5),blurRadius: 20),
                                                          ],
                                                          image: DecorationImage(
                                                            image: AssetImage('assets/images/ic_cooc.png'),
                                                            fit: BoxFit.cover,
                                                          )
                                                        ),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ),
                          bottomNavigationBar: BottomNavigationBar(
                            showSelectedLabels: false,
                            showUnselectedLabels: false,
                            type:BottomNavigationBarType.fixed,
                            elevation: 0.0,
                            backgroundColor:Color(0xFFF4F4F8),
                            items: [
                              BottomNavigationBarItem(
                                  icon:shadowWidget(
                                    child: Icon(Icons.home,color: Colors.red,size: 25,),
                                    isActive: true,
                                  ),
                                  label: "",
                              ),
                              BottomNavigationBarItem(
                                icon:shadowWidget(child: Icon(Icons.favorite_border,color: Colors.grey[700],size: 25,),),
                                label: "",
                              ),
                              BottomNavigationBarItem(
                                icon:shadowWidget(child:Icon(Icons.account_circle_outlined,color: Colors.grey[700],size: 25,)),
                                label: "",
                              ),
                              BottomNavigationBarItem(
                                icon:shadowWidget(child:Icon(Icons.timelapse,color: Colors.grey[700],size: 25,)),
                                label: "",
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ),
            ),
          )
      ),
    );
  }
  Widget shadowWidget({Widget? child,bool isActive=false}){
    return Container(
      child: child,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        boxShadow: [
          if(isActive)BoxShadow(color: Color(0xFFFA4A0C),offset: Offset(0,1),blurRadius: 15),
        ],
      ),
    );
  }
}