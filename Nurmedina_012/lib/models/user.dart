// models/user.dart
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth; //inisialisasi librari dgn as karena klo ga pake bisa konflik error

class User { //class untuk menyimpan data user
  String fullName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  String foto = "";

  User({ //konstruktornya, w/ required(wajib)
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.foto,
  });

  factory User.fromFirebaseUser(firebase_auth.User? firebaseUser) { //metode fromFirebaseUser utk buat objek user dri data user di firebase
    if (firebaseUser == null) { //periksa apakah data user di firebase null(tdk ada user terautentikasi)
      return User( //semua nilai diatur null
        fullName: '',
        email: '',
        password: '',
        confirmPassword: '',
        foto: '', 
      );
    }
//jika ada user terutentikasi
    return User(//buat objek user dri data yg ada di firebase
      fullName: firebaseUser.displayName ?? '', 
      email: firebaseUser.email ?? '',
      password: '',
      confirmPassword: '',
      foto: firebaseUser.photoURL ?? '',
    );
  }

}

