import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> regis(String email, String password) async {
    // Ganti 'User' menjadi 'userCredential' sesuai konvensi penamaan dan ambil hasil dari createUserWithEmailAndPassword
    UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }

  Future<UserCredential> login(String email, String password) async {
    // Ganti 'User' menjadi 'userCredential' dan ambil hasil dari signInWithEmailAndPassword
    UserCredential userCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential;
  }
}
