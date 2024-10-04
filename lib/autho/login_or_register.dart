import 'package:flutter/material.dart';
import 'package:weg_ale/Pages/login_page.dart';
import 'package:weg_ale/Pages/signup_page.dart';
class LoginOrRegister extends StatefulWidget {
  const LoginOrRegister({super.key});

  @override
  State<LoginOrRegister> createState() => _LoginOrRegisterState();
}

class _LoginOrRegisterState extends State<LoginOrRegister> {
  //Initaly, show the login page
  bool showLoginpage= true;

  //toggle between login and resgister
  void toggelPage(){
    setState(() {
      showLoginpage=!showLoginpage;
    });
  }
  @override
  Widget build(BuildContext context) {
    if (showLoginpage) {
      return LoginPage(
        onTap: toggelPage,
      );
    }else{
      return SignupPage(
        onTap: toggelPage,
      );
    }
  }
}
