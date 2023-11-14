import 'package:flutter/material.dart';

class User {
  String fullName = "";
  String email = "";
  String password = "";
  String confirmPassword = "";
  Image foto ;

  User({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.foto,
  });
}