import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sign_up_demo/screens/authenticate/authenticate.dart';
import 'package:sign_up_demo/screens/home/home.dart';
import 'package:sign_up_demo/models/user.dart';


class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {  
        
    final user = Provider.of<User>(context);
    print(user);
    //return either Home or Authenticate widget
    if (user ==null){
      return  Authenticate();
    } else {
      return Home();
    }
    
      
  }
}