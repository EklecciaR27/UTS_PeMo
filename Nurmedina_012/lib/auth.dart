// auth.dart
import 'package:cloud_firestore/cloud_firestore.dart';//library utk kelola data di firestroe db
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth; //utk kelola data w/ firebases autentikasi >> db autentikasi
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../models/user.dart' as my_models;
// import '../models/topupAmount.dart' as my_topUp;

class Auth extends ChangeNotifier { //class auth utk kelola di firebase authnya
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance; //variabel utk proses autentikasi ke dlm db autentikasi
  final FirebaseFirestore _firestore = FirebaseFirestore.instance; ////variabel utk proses autentikasi ke dlm db firestore

//method utk add user dgn fungsi regis
  Future<my_models.User> regis(String fullName, String email, String password,//parameter
      String confirmPassword, String foto) async {
    
    if (password != confirmPassword) { //cek password == confirm
      throw Exception("Passwords do not match");
    }

    try {//buat user baru pake firebase auth dgn data email + pw
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      //stlah berhasil, lanjut ngambil data user di autentikasi fb utk >> firestore
      firebase_auth.User? user = _auth.currentUser;

      //lalu proses nyimpan data user dgn smua property ke dalam firestore
      await FirebaseFirestore.instance.collection('users').doc(email).set({
        'fullName': fullName,
        'email': email,
        'foto': foto,
      });
//kembalikan nilai user baru
      return my_models.User(
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        foto: foto,
      );
      //error handling dulu sblm proses auth
    } on FirebaseAuthException catch (e) { //error handling dri firebase auth
      // Handle Firebase authentication exceptions
      if (e.code == 'weak-password') {
        print('Registration failed: The password provided is too weak.');
        throw Exception('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print(
            'Registration failed: The account already exists for that email.');
        throw Exception('The account already exists for that email.');
      } else {
        print('Registration failed: $e');
        throw e;
      }
    } catch (e) {
      // Handle other exceptions
      print('Registration failed: $e');
      throw e;
    }
  }

//methoe login dgn fungsi login
  Future<my_models.User> login(String email, String password) async { //parameter
    try {
      //login w/ auth
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      //ngambil data user di autentikasi fb
      firebase_auth.User? user = _auth.currentUser;
      //ngambil doc data user dri firestore by email
      DocumentSnapshot userDoc =
          await _firestore.collection('users').doc(email).get();
      //return data user dri firestore
      return my_models.User(
        fullName: userDoc.get('fullName'),
        email: userDoc.get('email'),
        password: '',
        confirmPassword: '',
        foto: '',
      );
    } catch (e) { //erro handling jika try gagal
      print('Login failed: $e');

      String errorMessage = "Failed to login. Please check your credentials.";

      if (e is FirebaseAuthException) {//error handling dri  fb auth
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for that user.';
        }
      }

      throw errorMessage;
    }
  }

//bukan dina
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

  Future<void> updateUserPhotoUrlInFirestore(
    User user,
    String photoUrl,
    String fotoID,
  ) async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc(user.email) // Menggunakan uid sebagai referensi unik
          .update({
        'foto': fotoID,
      });
    } catch (e) {
      print('Error updating user photo URL in Firestore: $e');
    }
  }
}
