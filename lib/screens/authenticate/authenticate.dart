import 'package:flutter/material.dart';
import 'package:sign_up_demo/screens/authenticate/register.dart';
import 'package:sign_up_demo/screens/authenticate/sign_in.dart';
import 'package:sign_up_demo/screens/authenticate/register.dart';

class Authenticate extends StatefulWidget {
  Authenticate({Key key}) : super(key: key);

  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  bool showSignIn = true;
  void toggleView() {
    setState(() =>
      showSignIn = !showSignIn
    );
  }

  @override
  Widget build(BuildContext context) {
   if (showSignIn){
     return SignIn(toogleView:  toggleView); 
   } else {
     return Register(toogleView:  toggleView);
   }
  }
}