import 'package:flutter/cupertino.dart';

class HomeProvider with ChangeNotifier{
  double borderValue=.0;
  bool isActive=false;
  int index=0;
  int indexBottom=0;
  void doActive(int index1){
    isActive=true;
    index=index1;
    notifyListeners();
  }
  void doActiveBottom(int index){
    indexBottom=index;
    notifyListeners();
  }
  void changeBorderRadius({double? borderValue1}){
    borderValue=borderValue1!;
    notifyListeners();
  }
  double get borderValueInfo=>this.borderValue;
  bool get getIsActiveInfo=>this.isActive;
  int get getIndexInfo=>this.index;
  int get getIndexBottomInfo=>this.indexBottom;
}