import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sign_up_demo/services/auth.dart';
import 'package:sign_up_demo/services/database.dart';
import 'package:provider/provider.dart';
import 'package:sign_up_demo/models/brew.dart';

class Home extends StatelessWidget {


  final Authservice _auth = Authservice();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Brew>>.value(
          value : DatabaseService().brews,
           
          child: Scaffold(
          backgroundColor: Colors.brown[50],
          appBar: AppBar(
            title: Text('Brew Crew'),
            backgroundColor: Colors.brown[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('logout'),
                  onPressed: () async{
                    await _auth.signOut();

                  },
                 )
            ],
          )),
    );
  }
}
