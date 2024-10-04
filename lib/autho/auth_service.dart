import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  // Instance of auth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in
  Future<UserCredential> signInWithEmailPassword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential; // Return the user credential on successful login
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  // sign out
  Future<void> signOut () async{
    return await _auth.signOut();

  }
}
