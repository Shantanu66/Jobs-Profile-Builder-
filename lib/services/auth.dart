import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  User get currentUser;

  Future<User> signInAnonymously();

  Future<void> signOut();
}

class Auth implements AuthBase {
  final _firebaseauth = FirebaseAuth.instance;

  @override
  User get currentUser => FirebaseAuth.instance.currentUser;

  @override
  Future<User> signInAnonymously() async {
    try {
      final usercredentials = await _firebaseauth.signInAnonymously();
      return usercredentials.user;
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseauth.signOut();
  }
}
