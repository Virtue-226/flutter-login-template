import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sign_up_demo/models/brew.dart';
 class DatabaseService {

   final String uid;
   DatabaseService({this.uid});
   //collection reference

   final CollectionReference brewCollection  = Firestore.instance.collection('brews');

   Future updateUserData(String sugars, String name, int strength) async {
     return await brewCollection.document(uid).setData({
       'sugars' : sugars,
        'name' : name,
        'strength' : strength,
     });
   }

   // brew list from snapshot
   List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot){
     return snapshot.documents.map((doc){
       return Brew(
          name: doc.data['name'] ?? '',
          strength: doc.data['strength'] ?? 0,
          sugar: doc.data['sugars'] ?? '0'
       );
     }).toList();

   }

   //get brew stream
   Stream<List<Brew>> get brews {
     return brewCollection.snapshots()
     .map(_brewListFromSnapshot);
   }

 } 


 