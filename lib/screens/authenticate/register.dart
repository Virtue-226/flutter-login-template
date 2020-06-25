import 'package:flutter/material.dart';
import 'package:sign_up_demo/services/auth.dart';
import 'package:sign_up_demo/shared/constants.dart';
import 'package:sign_up_demo/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toogleView;
  Register({this.toogleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

 final Authservice _auth = Authservice();
  final _formkey = GlobalKey<FormState>();

  String email = '';
 String password = '';
 String error = '';
  
  bool loading = false;


  @override
  Widget build(BuildContext context) {
    return loading? Loading(): Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sign Up to Brew Crew'),
         actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person) ,
            label: Text('Sign In'),
            onPressed: () {
              widget.toogleView();
            } ,)
        ],
      ),
      body:  Container(
        child: Form(
          key: _formkey,
          child: Column(
            children : <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText : 'Email'),
                validator: (val) => val.isEmpty ? 'Enter an email' : null,
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });

                }
              ),
              SizedBox(height: 20.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Password'),
                validator: (val) => val.length < 6 ? 'Enter a password 6+ long': null,
                obscureText: true,
                onChanged: (val){
                  setState(() {
                    email = val;
                  });

                }
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white
                  ),
                  
                ),
                onPressed: () async {
                  if(_formkey.currentState.validate()){
                    setState(() {
                      loading = true;
                    });
                   dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                     if(result == null){
                       setState(() {
                         error = 'Please supply a valid email';
                         loading = false;
                       }

                       );
                     }
                  }
                }),
                SizedBox(height: 12.0),
                Text(
                  error,
                  style: TextStyle(color: Colors.red, fontSize: 14.0),

                ),
            ],
          )), 
       
            
          ),
    );
  }
}