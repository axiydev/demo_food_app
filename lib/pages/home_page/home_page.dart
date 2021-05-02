import 'package:demo_app/models/card_model.dart';
import 'package:demo_app/pages/custom_widgets/custom_card_widget.dart';
import 'package:demo_app/pages/home_page/home_provider.dart';
import 'package:demo_app/pages/main_page/main_provider.dart';
import 'package:demo_app/pages/product_page/product_page.dart';
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
    ProductMod.hero(about:"Veggie tomato mix", price: "N200", image:"assets/images/ic_cooc.png",heroTag: "sds"),
    ProductMod.hero(about:"Veggie tomato mix", price: "N200", image:"assets/images/ic_cooc.png",heroTag: "sdwewoi"),
    ProductMod.hero(about:"Veggie tomato mix", price: "N200", image:"assets/images/ic_cooc.png",heroTag: "lskkjsk"),
    ProductMod.hero(about:"Veggie tomato mix", price: "N200", image:"assets/images/ic_cooc.png",heroTag: "jksakdj"),
    ProductMod.hero(about:"Veggie tomato mix", price: "N200", image:"assets/images/ic_cooc.png",heroTag: "kjskdjs"),
    ProductMod.hero(about:"Veggie tomato mix", price: "N200", image:"assets/images/ic_cooc.png",heroTag: "jhsdhs"),
    ProductMod.hero(about:"Veggie tomato mix", price: "N200", image:"assets/images/ic_cooc.png",heroTag: "kjsksjd"),
    ProductMod.hero(about:"Veggie tomato mix", price: "N200", image:"assets/images/ic_cooc.png",heroTag: "jsksjdk"),
    ProductMod.hero(about:"Veggie tomato mix", price: "N200", image:"assets/images/ic_cooc.png",heroTag: "ksldks"),
    ProductMod.hero(about:"Veggie tomato mix", price: "N200", image:"assets/images/ic_cooc.png",heroTag: "kajsdkjk"),
  ];
  List? lt=[
    "Food",
    "Drink",
    "Fast",
    "Food",
    "Food",
    "Drink",
    "Fast",
    "Food",
    "Food",
    "Drink",
    "Fast",
    "Food",
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
  bool? isActive1=false;
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
              builder:(context,child)=>Transform(
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
                        child:Scaffold(
                          backgroundColor: Colors.transparent,
                          appBar: AppBar(
                            elevation: 0.0,
                            bottomOpacity: 0.0,
                            backgroundColor:Color(0xFFF4F4F8),
                            brightness: Brightness.light,
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
                                      SizedBox(height: 20,),
                                      //#category
                                      Container(
                                          height: size.width*0.15,
                                          width: size.width,
                                          color: Color(0xFFF4F4F8),
                                          child: Container(
                                            child: ListView.builder(
                                              itemCount: lt?.length,
                                              shrinkWrap: true,
                                              scrollDirection: Axis.horizontal,
                                              itemBuilder: (context,index)=>InkWell(
                                                child:categoryWid(context,text: lt![index],isActive:index==valueHome.getIndexInfo?true:false),
                                                onTap: (){
                                                  valueHome.doActive(index);
                                                },
                                              ),
                                            ),
                                          )
                                      ),
                                      SizedBox(height: 20,),
                                      //#see more
                                      Container(
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          width: size.width,
                                          alignment: Alignment.centerRight,
                                          child:InkWell(
                                            child: Text("see more",
                                              style: TextStyle(color: Color(0xFFFA4A0C)),
                                            ),
                                            onTap: (){},
                                          )
                                      ),
                                      //#listviev horizontal
                                      Container(
                                        height: size.height*0.45,
                                        padding: EdgeInsets.symmetric(vertical: 20),
                                        color:Color(0xFFF4F4F8),
                                        child:ListView.builder(
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemCount:listOne?.length,
                                          itemBuilder:(context,index)=>GestureDetector(
                                            child: CustomCard(productMod:listOne![index]),onTap: (){
                                            Navigator.of(context).push(new MaterialPageRoute(builder:(context)=>ProductPage(productMod:listOne![index])));
                                          },),
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
                            onTap: (index){
                              valueHome.doActiveBottom(index);
                            },
                            items: [
                              BottomNavigationBarItem(
                                icon:shadowWidget(
                                  child: Icon(Icons.home,color:valueHome.getIndexBottomInfo==0?Colors.red:Colors.grey[700],size: 25,),
                                  isActive:valueHome.getIndexBottomInfo==0?true:false,
                                ),
                                label: "",
                              ),
                              BottomNavigationBarItem(
                                icon:shadowWidget(child: Icon(Icons.favorite_border,color: valueHome.getIndexBottomInfo==1?Colors.red:Colors.grey[700],size: 25,),
                                  isActive:valueHome.getIndexBottomInfo==1?true:false,
                                ),
                                label: "",
                              ),
                              BottomNavigationBarItem(
                                icon:shadowWidget(child:Icon(Icons.account_circle_outlined,color: valueHome.getIndexBottomInfo==2?Colors.red:Colors.grey[700],size: 25,),
                                  isActive:valueHome.getIndexBottomInfo==2?true:false,),
                                label: "",
                              ),
                              BottomNavigationBarItem(
                                icon:shadowWidget(child:Icon(Icons.timelapse,color:valueHome.getIndexBottomInfo==3?Colors.red:Colors.grey[700],size: 25,),
                                  isActive:valueHome.getIndexBottomInfo==3?true:false,),
                                label: "",
                              ),
                            ],
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

  Widget categoryWid(BuildContext context,{String? text,bool isActive=false}){
    final Size size=MediaQuery.of(context).size;
    return AspectRatio(
        aspectRatio:2/1.4,
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(0.0),
          ),
          child: Container(
            height: size.width*0.1,
            decoration: BoxDecoration(
              color: Color(0xFFF4F4F8),
              border: isActive?Border(bottom: BorderSide(width: 3,color: Color(0xFFFA4A0C))):null,
            ),
            child: Center(
              child: Text(text.toString(),style: GoogleFonts.rubik(color:isActive?Color(0xFFFA4A0C):Colors.grey[700],fontSize: 16,fontWeight: FontWeight.w400),),
            ),
          ),
        ),
      );
  }
}