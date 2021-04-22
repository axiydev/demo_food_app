import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier{
  double borderValue=.0;
  void changeBorderRadius({double? borderValue1}){
    borderValue=borderValue1!;
    notifyListeners();
  }
  double get borderValueInfo=>this.borderValue;
}