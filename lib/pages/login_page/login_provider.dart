import 'package:demo_app/pages/main_page/main_page.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider with ChangeNotifier{
  bool isLogin=true;
  bool isSignUp=false;
  void Sign_Up(){
    isLogin=false;
    isSignUp=true;
    notifyListeners();
  }
  void log_in(){
    isLogin=true;
    isSignUp=false;
    notifyListeners();
  }
  bool get loginInfo=>this.isLogin;
  bool get signUpInfo=>this.isSignUp;

//#
void login_to_account(BuildContext context,{String? email,String? password}){
  if(email!.isNotEmpty&&password!.isNotEmpty){
    Navigator.pushReplacementNamed(context,MainPage.id);
    notifyListeners();
  }
}
}