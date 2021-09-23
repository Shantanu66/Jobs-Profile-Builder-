import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  User get currentUser => FirebaseAuth.instance.currentUser;
  final _firebaseauth=FirebaseAuth.instance;

  Future<void> SignInAnonymously() async {
    try {
      final usercredentials = await _firebaseauth.signInAnonymously();
      return usercredentials.user;
    }
    catch (e) {
      print(e.toString());
    }
  }
  Future<void> SignOut() async{
    await _firebaseauth.signOut();
  }
}