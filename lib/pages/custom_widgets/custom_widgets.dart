library custom_widget;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
mixin AdditionalWidgets{
  Widget customTextField(BuildContext context,{isPassword=false,controller,label,hint}){
    final Size size=MediaQuery.of(context).size;
    return  Container(
      child: TextField(
        controller: controller,
        obscureText: isPassword?true:false,
        style:GoogleFonts.rubik(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelText: "${label}",
          labelStyle: GoogleFonts.rubik(
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),

          hintText: "${hint}",
          hintStyle:GoogleFonts.rubik(
            fontWeight: FontWeight.w400,
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}