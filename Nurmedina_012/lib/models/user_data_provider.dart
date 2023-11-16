import 'dart:collection';

import 'package:flutter/material.dart';
import 'user.dart';

class UserDataProvider extends ChangeNotifier {
  final List<User> _myUsers = [];

  UnmodifiableListView<User> get myUsers => UnmodifiableListView(_myUsers);

  int get userCount => _myUsers.length;

  void addUser(User newUser) {
    _myUsers.add(newUser);
    notifyListeners();
    
  }
}