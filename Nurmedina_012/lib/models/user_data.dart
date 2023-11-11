import 'package:flutter/material.dart';
import 'dart:collection';

import 'user.dart';

class userData extends ChangeNotifier {
  final List<User> _myUser = [
   
  ];

  int get userCount {
    return _myUser.length;
  }

  void addUser(User newUser) {
    _myUser.add(newUser);
    notifyListeners();
  }
}