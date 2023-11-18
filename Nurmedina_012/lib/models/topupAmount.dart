import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class TopupAmount {
  double nominal;
  String email;
  String fullName;

  TopupAmount({
    required this.nominal,
    required this.email,
    required this.fullName,
  });

  Map<String, dynamic> toMap() {
    return {
      'nominal': nominal,
      'email': email,
      'fullName': fullName,
    };
  }
}
