import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> regis(String fullName, String email, String password, String confirmPassword) async {
    if (password != confirmPassword) {
      // Passwords do not match
      // Handle this case as needed, e.g., show an error message.
      throw Exception("Passwords do not match");
    }

    try {
      // Create user with email and password
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Get the currently logged-in user
      User? user = _auth.currentUser;

      // Save additional user data to Firestore
      await _firestore.collection('users').doc(user!.uid).set({
        'fullName': fullName,
        'email': email,
        // Add more fields as needed
      });

      // Registration successful
    } catch (e) {
      // Handle registration error
      print('Registration failed: $e');
      throw e; // You can decide whether to rethrow the exception or handle it here
    }
  }

  // Method for login
  // Method for login
  Future<String?> login(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);

      // Get the currently logged-in user
      User? user = _auth.currentUser;

      // Retrieve user data from Firestore
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user!.uid).get();

      // Return the full name
      return userDoc.get('fullName') as String?;
    } catch (e) {
      print('Login failed: $e');
      // Handle login error
      String errorMessage = "Failed to login. Please check your credentials.";

      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          errorMessage = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password provided for that user.';
        }
        // You can handle other error codes as needed
      }

      throw errorMessage; // Rethrow the customized error message
    }
  }

  // Tambahkan fungsi untuk mendapatkan full name pengguna
  Future<String?> getFullName() async {
    try {
      User? user = _auth.currentUser;
      // Mendapatkan dokumen pengguna dari Firestore
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(user!.uid).get();
      // Mengembalikan full name dari dokumen pengguna
      return userDoc.get('fullName') as String?;
    } catch (e) {
      print('Error getting full name: $e');
      return null;
    }
  }
  }
