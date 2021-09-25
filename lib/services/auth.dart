import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class AuthBase {
  User get currentUser;

  Future<User> signInAnonymously();

  Future<void> signOut();

  Stream<User> AuthStateChanges();

  Future<User> signInwithGoogle();
}

class Auth implements AuthBase {
  final _firebaseauth = FirebaseAuth.instance;

  @override
  Stream<User> AuthStateChanges() => _firebaseauth.authStateChanges();

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

  Future<User> signInwithGoogle() async {
    final googlesignin = GoogleSignIn();
    final googleuser = await googlesignin.signIn();
    if (googleuser != null) {
      final googleauth = await googleuser.authentication;
      if (googleauth.idToken != null) {
        final userCredential = await _firebaseauth.signInWithCredential(
            GoogleAuthProvider.credential(
                idToken: googleauth.idToken,
                accessToken: googleauth.accessToken
            )
        );
        return userCredential.user;
      }else{
        throw FirebaseAuthException(
          code:"ERROR MISSING GOOGLE ID TOKEN",
          message: 'MISSING GOOGLE ID TOKEN'
        );
      }
    }
    else {
      throw FirebaseAuthException(
          code: "ERROR ABORTED BY USER",
          message:'SIGN IN ABORTED BY USER',
      );
    }
  }

  @override
  Future<void> signOut() async {
    final googlesignin=GoogleSignIn();
    await googlesignin.signOut();
    await _firebaseauth.signOut();
  }
}
