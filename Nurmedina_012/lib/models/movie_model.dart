// models/movie_model.dart
import 'package:flutter/material.dart';
import 'movies.dart';

class MovieModel extends ChangeNotifier {
  List<Movies> _movies = [];

  List<Movies> get movies => _movies;

  void setMovies(List<Movies> movies) {
    _movies = movies;
    notifyListeners();
  }
}
