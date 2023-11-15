// auth.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user.dart' as my_models;

class Auth {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<my_models.User> regis(String fullName, String email, String password, String confirmPassword, String foto) async {
    if (password != confirmPassword) {
      throw Exception("Passwords do not match");
    }

    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      firebase_auth.User? user = _auth.currentUser;

      await _firestore.collection('users').doc(user!.uid).set({
        'fullName': fullName,
        'email': email,
      });

      return my_models.User(
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        foto: foto,
      );
    } catch (e) {
      print('Registration failed: $e');
      throw e;
    }
  }

  Future<my_models.User> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      firebase_auth.User? user = _auth.currentUser;

      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user!.uid).get();

      return my_models.User(
          fullName: userDoc.get('fullName'),
          email: userDoc.get('email'),
          password: '',
          confirmPassword: '',
          foto: 'default_image_path', 
      );
    } catch (e) {
      print('Login failed: $e');

      String errorMessage = "Failed to login. Please check your credentials.";

      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for that user.';
        }
      }

      throw errorMessage;
    }
  }
Future<my_models.User?> getFullName() async {
  try {
    firebase_auth.User? user = _auth.currentUser;

    DocumentSnapshot userDoc = await _firestore.collection('users').doc(user!.uid).get();

    return my_models.User(
      fullName: userDoc.get('fullName') as String? ?? '', 
      email: user.email ?? '',
      password: '',
      confirmPassword: '',
      foto: '', 
    );
  } catch (e) {
    print('Error getting full name: $e');
    return null;
  }
}

}
