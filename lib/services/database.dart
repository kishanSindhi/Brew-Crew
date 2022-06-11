import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");

  Future updateUserData(String sugar, String name, int strength) async {
    // Creates a collection when the user register 
    return await brewCollection.doc(uid).set({
      'sugar': sugar, 'name':name, 'strength':strength,
    });
  } 

  // get brews stream 
  Stream<QuerySnapshot> get brews {
    return brewCollection.snapshots();
  }
}
