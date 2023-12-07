import 'dart:collection';//libararu utk UnmodifiableListView
import 'package:flutter/material.dart'; //libarary utk widget ui
import 'user.dart';//import file user >> class

class UserData extends ChangeNotifier {//class utk kelola data user
  final List<User> _myUsers = []; //variabel _myUsers utk nyimpan data User

  UnmodifiableListView<User> get myUsers => UnmodifiableListView(_myUsers);


  int get userCount { //getter utk jumlah user 
    return _myUsers.length;
  }

  void addUser(User newUser) { //method utk nambah data user newUser>> ke list _myUsers
    _myUsers.add(newUser);
    notifyListeners();
  }

  void updateUserByEmail(String userEmail, User updatedUser) { //update user berdasarkan email
    int index = _myUsers.indexWhere((user) => user.email == userEmail); //cari indeks user di dalam list berdasarkan email

    if (index != -1) { //jika indeks dengan alamat email yg diberi didapat
      _myUsers[index] = updatedUser;//ganti  user lama w/ informasi terupdate
      notifyListeners();
    } else {//jika tdk ada
      print('User with email $userEmail not found.');
    }
  }


}
