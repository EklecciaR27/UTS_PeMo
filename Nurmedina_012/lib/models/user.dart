// models/user.dart
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class User {
  String fullName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  String foto = "";

  User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.foto,
  });

  factory User.fromFirebaseUser(firebase_auth.User? firebaseUser) {
    if (firebaseUser == null) {
      return User(
        fullName: '',
        email: '',
        password: '',
        confirmPassword: '',
        foto: '', // Replace with your default image path
      );
    }

    return User(
      fullName: firebaseUser.displayName ?? '', // Adjust based on your needs
      email: firebaseUser.email ?? '',
      password: '',
      confirmPassword: '',
      foto: firebaseUser.photoURL ?? '',
    );
  }

}

