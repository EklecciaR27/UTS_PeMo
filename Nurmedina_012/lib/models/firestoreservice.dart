import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> updateFullName(String userId, String newFullName) async {
    await usersCollection.doc(userId).update({'fullName': newFullName});
  }
}
