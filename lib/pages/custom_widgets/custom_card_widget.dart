import 'package:demo_app/models/card_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class CustomCard extends StatelessWidget {
  final ProductMod productMod;
  const CustomCard({required this.productMod});
  @override
  Widget build(BuildContext context) {
    final Size size =MediaQuery.of(context).size;
    return Card(
      margin: EdgeInsets.only(left: 20),
      elevation: 0.0,
      child: Container(
        width: size.width*0.45,
        color: Color(0xFFF4F4F8),
        child:Container(
          child: Stack(
            children: [
              Container(
                height:double.infinity,
                width: double.infinity,
                margin: EdgeInsets.only(top:50,bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.white,
                  border: Border.all(width: 0.1,color: Colors.grey),
                  boxShadow: [
                    BoxShadow(color: Colors.grey[300]!,offset: Offset(0,3),blurRadius: 15,),
                  ],
                ),
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      padding: EdgeInsets.only(bottom:size.width*0.1,left: 15,right: 15),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text:TextSpan(
                            text:productMod.about.toString()+"\n\n",
                            style: GoogleFonts.rubik(fontSize:20,color: Colors.black,height: 1,fontWeight: FontWeight.w600),
                            children: [
                              TextSpan(text:productMod.price.toString(),style: GoogleFonts.rubik(color: Color(0xFFFA4A0C),fontSize: 18)),
                            ]
                        ),
                      ),
                    )
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: size.width*0.3,
                  width: size.width*0.3,
                  margin: EdgeInsets.only(top:10),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.grey[300]!,offset: Offset(0,6),blurRadius: 20,),
                      ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(size.width*0.3/2),
                    child: FadeInImage(
                      image: AssetImage(productMod.image.toString()),
                      placeholder: AssetImage("assets/images/ic_logo.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
