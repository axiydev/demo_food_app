import 'package:demo_app/const.dart';
import 'package:demo_app/models/card_model.dart';
import 'package:demo_app/pages/product_page/product_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  static const String id="product_page";
  late ProductMod  productMod;
  ProductPage({required this.productMod});
  static Widget screen(productModel)=>ChangeNotifierProvider(
    create:(context)=>ProductProvider(),
    child: ProductPage(productMod: productModel,),
  );
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: backColor,
       appBar: AppBar(
         leading: IconButton(
           icon: Icon(Icons.arrow_back_ios_outlined,color: appBarIconColor,),
           onPressed: (){
             Navigator.of(context).pop();
           },
         ),
         backgroundColor: backColor,
         elevation: 0.0,
         bottomOpacity: 0.0,
       ),
       body: Center(
         child: Container(
           height: 200,
           width: 200,
           child: ClipRRect(
             child: Image.asset(widget.productMod.image.toString(),fit: BoxFit.cover,),
           )
         ),
       ),
    );
  }
}
