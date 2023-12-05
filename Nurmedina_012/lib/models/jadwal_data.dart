import 'package:flutter/material.dart';
import 'package:main/models/jadwal.dart';

class JadwalProvider extends ChangeNotifier {
  final List<CategoriTimes> _timesCategory = [
    CategoriTimes(tanggal: "30", hari: "Mon"),
    CategoriTimes(tanggal: "31", hari: "Tue"),
    CategoriTimes(tanggal: "1", hari: "Wed"),
    CategoriTimes(tanggal: "2", hari: "Thur"),
    CategoriTimes(tanggal: "3", hari: "Fri"),
    CategoriTimes(tanggal: "4", hari: "Sat"),
  ];

  List<CategoriTimes> get timesCategory => _timesCategory;

  CategoriTimes? _selectedTime;

  CategoriTimes? get selectedTime => _selectedTime;

  void toggleSelectedTime(int index) {
    _selectedTime = _timesCategory[index];
    _selectedTime!.isSelected = !_selectedTime!.isSelected;
    notifyListeners();
  }

  bool isSelectedTime(int index) {
    return _timesCategory[index].isSelected;
  }
}
