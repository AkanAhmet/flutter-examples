import 'package:firebase_auth/firebase_auth.dart';

class Auth {

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => firebaseAuth.authStateChanges();

  // Register

  Future<void> createUser({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    print("Succeed ! Current User Id : ${firebaseAuth.currentUser!.uid} ");
  }

// Login

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

// Sign Out

  Future<void> signOut({
    required String email,
    required String password,
  }) async {
    await firebaseAuth.signOut();
  }

}
