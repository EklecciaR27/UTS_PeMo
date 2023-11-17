import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:main/models/topupAmount.dart';

class TopupData extends ChangeNotifier {
  final List<TopupAmount> _myTopup = [];
  

  UnmodifiableListView<TopupAmount> get myTopups => UnmodifiableListView(_myTopup);

  // int get userCount {
  //   return _myTopup.length;
  // }

  void addTopUp(TopupAmount newTopUp) {
    _myTopup.add(newTopUp);
    notifyListeners();
  }

    void updateTopUp(TopupAmount updatedTopUp) {
    int index = _myTopup.indexWhere((topUp) => topUp.email == updatedTopUp.email);

    if (index != -1) {
      _myTopup[index] = updatedTopUp;
      notifyListeners();
    }
  }
}
