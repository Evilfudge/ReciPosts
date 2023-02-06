import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recies/models/username.dart';

class UsernameCollections {

  final String? uid;
  UsernameCollections({this.uid});

  //collection reference
  final CollectionReference userCollection =
  FirebaseFirestore.instance.collection('username');

  Future updateUsername(String username) async {
    return await userCollection.doc(uid).set({'username': username});
  }


  List<Username> _usernameSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Username(
          username: doc.get('username') ?? '',
      );
    }).toList();
  }
  Stream<List<Username>> get usernames {
    return userCollection.snapshots()
        .map(_usernameSnapshot);
  }
}