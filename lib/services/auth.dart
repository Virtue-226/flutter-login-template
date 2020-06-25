import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_up_demo/models/user.dart';
import 'package:sign_up_demo/services/database.dart';
class Authservice {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  //create user obj based on FirebaseUser
  User _userFromFirebaseUser(FirebaseUser user){
    return user != null ? User(uid: user.uid) : null;

  }


  //auth change User stream
  Stream<User> get user {
    return _auth.onAuthStateChanged
    .map((FirebaseUser user) => _userFromFirebaseUser(user));

  }

//Anonymous
Future signInAnon() async {
  try {
 AuthResult result = await _auth.signInAnonymously();
 FirebaseUser user = result.user;
 return _userFromFirebaseUser(user);
  }catch(e){
    print(e.toString());
    return null;

  }
}
//sign in email 
Future signInWithEmailAndPassword(String  email, String password)async {
  try{
    AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;
    return _userFromFirebaseUser(user);

  } catch(e) {
    print(e.toString());
    return null;

  }
   
} 
//register
Future registerWithEmailAndPassword(String email, String password) async {
  
  try{
    AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    FirebaseUser user = result.user;

    // create a new document for the user with the uid
    await DatabaseService(uid: user.uid).updateUserData('0', 'new crew member', 100);
    return _userFromFirebaseUser(user);

    

  } catch(e) {
    print(e.toString());
    return null;

  }
}
//signout
Future signOut() async {
  try{
      return await _auth.signOut();
  }catch(e){
     print(e.toString());
     return null;
  }
}

}