import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';

abstract class AuthBase {
  Future<User> createAccountWithEmailandPassword(String email, String password);
  Stream<User?> authstateChange();
}

class Auth implements AuthBase {
  @override
  Stream<User?> authstateChange() => FirebaseAuth.instance.authStateChanges();

  @override
  Future<User> createAccountWithEmailandPassword(
      String email, String password) async {
    final credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return credential.user!;
  }
}
