
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  
  Future<void> updateUserPhotoUrl(String photoUrl) async {
    try {
      var user = _auth.currentUser;
      if (user != null) {
        await user.updatePhotoURL(photoUrl);
        await user.reload();
        user = _auth.currentUser;
      }
    } catch (e) {
      print('Error: $e');
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
          .doc(user.email) // Menggunakan id email sebagai referensi unik
          .update({
        'foto': fotoID,
      });
    } catch (e) {
      print('Error : $e');
    }
  }
}