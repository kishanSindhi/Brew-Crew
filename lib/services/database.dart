import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:demo_firebase/models/brew.dart';

class DatabaseService {
  final String uid;
  DatabaseService({required this.uid});
  final CollectionReference brewCollection =
      FirebaseFirestore.instance.collection("brews");

  Future updateUserData(String sugar, String name, int strength) async {
    // Creates a collection when the user register
    return await brewCollection.doc(uid).set({
      'sugar': sugar,
      'name': name,
      'strength': strength,
    });
  }

  // brew list from snapshot
  List<Brew> _brewListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      return Brew(
        name: (doc.data() as dynamic)['name'] ?? '',
        sugar: (doc.data() as dynamic)['sugar'] ?? '1',
        strength: (doc.data() as dynamic)['strength'] ?? 100,
      );
    }).toList();
  }

  // get brews stream
  Stream<List<Brew?>> get brews {
    return brewCollection.snapshots().map(_brewListFromSnapshot);
  }
}
