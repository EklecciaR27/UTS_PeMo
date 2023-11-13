import 'package:flutter/material.dart';

class User {
  String fullName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
   String? foto; // Menjadikan 'foto' opsional

  User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.foto, // Opsional karena menggunakan tanda tanya (?)
  });
}