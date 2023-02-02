import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});

  //collection reference
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('userData');

  Future updateUsername(String username) async {
    return await userCollection.doc(uid).set({'username': username});
  }
}