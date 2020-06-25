import 'package:flutter/material.dart';
import 'package:sign_up_demo/services/auth.dart';
import 'package:sign_up_demo/shared/constants.dart';
import 'package:sign_up_demo/shared/loading.dart';

class SignIn extends StatefulWidget {
  final Function toogleView;
  SignIn({this.toogleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final Authservice _auth = Authservice();
  bool loading = false;
  final _formkey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = ' ';
  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              title: Text('Sign in to Brew Crew'),
              actions: <Widget>[
                FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Register'),
                  onPressed: () {
                    widget.toogleView();
                  },
                )
              ],
            ),
            body: Container(
                child: Form(
                    key: _formkey,
                    child: Column(children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                          validator: (val) =>
                              val.isEmpty ? 'Enter an email' : null,
                          decoration:
                              textInputDecoration.copyWith(hintText: 'Email'),
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          }),
                      SizedBox(height: 20.0),
                      TextFormField(
                          validator: (val) => val.length < 6
                              ? 'Enter a password 6+ long'
                              : null,
                          decoration: textInputDecoration.copyWith(
                              hintText: 'Password'),
                          obscureText: true,
                          onChanged: (val) {
                            setState(() {
                              email = val;
                            });
                          }),
                      SizedBox(height: 20.0),
                      RaisedButton(
                          color: Colors.pink[400],
                          child: Text(
                            'Sign in',
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () async {
                            if (_formkey.currentState.validate()) {
                              setState(() => loading = true);
                              dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                              if (result == null) {
                                setState(() {
                                  error =
                                      'could not sign in with those credential';
                                });
                              }
                            }
                          }),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ]))),
          );
  }
}
