import 'package:firebase_auth/firebase_auth.dart';
import 'package:recies/controller/usernamecollections.dart';
import 'package:recies/models/reciposts_user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // create Firebase user
  RecipostsUser? _userFromFirebase(User? user) {
    return user != null ? RecipostsUser(uid: user.uid) : null;
  }

  //auth change user stream
  Stream<RecipostsUser> get user {
    return _auth.authStateChanges()
        .map((User? user) => _userFromFirebase(user!)!);
  }
  //sign in email/password
  Future login(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      User user = result.user!;
      return _userFromFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }

  //register email/password
  Future register(String email, String password, String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await FirebaseAuth.instance.currentUser!.updateDisplayName(username);
      User user = result.user!;

      await UsernameCollections(uid: user.uid).updateUsername(username);
      return _userFromFirebase(user);
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
  //sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
      return null;
    }
  }
}