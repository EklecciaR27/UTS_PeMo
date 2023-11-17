// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import '../models/user.dart' as my_models;
// import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

// class UserService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//  Future<my_models.User?> getFullName() async {
//     try {
//       firebase_auth.User? user = _auth.currentUser;

//       DocumentSnapshot userDoc = await _firestore.collection('users').doc(user!.uid).get();

//       return my_models.User(
//         fullName: userDoc.get('fullName') as String? ?? '', 
//         email: user.email ?? '',
//         password: '',
//         confirmPassword: '',
//         foto: '', 
//       );
//     } catch (e) {
//       print('Error getting full name: $e');
//       return null;
//     }
//   }

// Future<my_models.User?> getEmail() async {
//   try {
//     firebase_auth.User? user = _auth.currentUser;

//     DocumentSnapshot userDoc = await _firestore.collection('users').doc(user!.uid).get();

//     return my_models.User(
//       fullName:  user.email ?? '', 
//       email:userDoc.get('email') as String? ?? '',
//       password: '',
//       confirmPassword: '',
//       foto: '', 
//     );
//   } catch (e) {
//     print('Error getting email: $e');
//     return null;
//   }
// }
// }
