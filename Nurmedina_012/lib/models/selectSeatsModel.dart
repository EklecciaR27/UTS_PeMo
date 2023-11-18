import 'package:flutter/material.dart';

class SelectedSeatsModel extends ChangeNotifier {
  List<String> _selectedSeats = [];
  List<String> get selectedSeats => _selectedSeats;

  void addSelectedSeat(String seat) {
    _selectedSeats.add(seat);
    notifyListeners();
  }

  void removeSelectedSeat(String seat) {
    _selectedSeats.remove(seat);
    notifyListeners();
  }
}
