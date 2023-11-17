// topup_service.dart

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:main/models/topupAmount.dart';


class TopupService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<TopupAmount?> getNominalTopUp(String email) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('topup_amount').doc(email).get();

      if (userDoc.exists) {
        return TopupAmount(
          nominal: (userDoc.get('nominal') ?? 0.0).toDouble(),
          email: email,
          fullName: userDoc.get('fullName') as String? ?? '',
        );
      } else {
        return null;
      }
    } catch (e) {
      print('Error getting top-up amount: $e');
      return null;
    }
  }
}
