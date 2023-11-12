class TopupAmount {
  double nominal;
  String email;

  TopupAmount({
    required this.nominal,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      'nominal': nominal,
      'email': email,
    };
  }
}
