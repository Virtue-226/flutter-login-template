import 'package:flutter/material.dart';
import 'services/auth.dart';
import 'package:sign_up_demo/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:sign_up_demo/models/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: Authservice().user,
          child: MaterialApp(
        debugShowCheckedModeBanner: false,
       home: Wrapper() ,
      ),
    );
  }
}

