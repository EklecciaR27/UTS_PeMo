import 'dart:collection';
import 'package:flutter/material.dart';
import 'user.dart';

class UserData extends ChangeNotifier {
  final List<User> _myUsers = [];

  UnmodifiableListView<User> get myUsers => UnmodifiableListView(_myUsers);

  int get userCount {
    return _myUsers.length;
  }

  void addUser(User newUser) {
    _myUsers.add(newUser);
    notifyListeners();
  }

  void updateUserByEmail(String userEmail, User updatedUser) {
    int index = _myUsers.indexWhere((user) => user.email == userEmail);

    if (index != -1) {
      _myUsers[index] = updatedUser;
      notifyListeners();
    } else {
      print('User with email $userEmail not found.');
    }
  }


}
