// auth.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart' as my_models;
import '../models/topupAmount.dart' as my_topUp;

class Auth extends ChangeNotifier{
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
        'foto': foto,
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

    Future<void> updateUserPhotoUrl(String photoUrl) async {
    try {
      var user = _auth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(photoUrl);
        await user.reload();
        user = _auth.currentUser; // Refresh user data
      }
    } catch (e) {
      print('Error updating user photo URL: $e');
    }
  }



Future<void> updateUserPhotoUrlInFirestore(BuildContext context, my_models.User user, String photoUrl) async {
  try {
    var firestore = FirebaseFirestore.instance;

    // Assuming 'users' is your collection name
    var userRef = firestore.collection('users').doc(user.email);

    // Fetch the current data to check if 'foto' is empty
    var userData = await userRef.get();
    var currentFoto = userData['foto'];

    if (currentFoto == null || currentFoto.isEmpty) {
      // 'foto' is empty, update it with the new photoUrl
      await userRef.update({'foto': photoUrl});
    }

    // If 'foto' is not empty, you can handle it differently or do nothing
  } catch (e) {
    print('Error updating user photo URL in Firestore: $e');
    throw e;
  }
}


}