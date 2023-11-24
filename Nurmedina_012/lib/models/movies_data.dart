import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart'; // Import library untuk BuildContext
import 'package:main/models/movie_model.dart';
import 'package:provider/provider.dart';

import 'movies.dart';

class MovieApi {
  static const apiKey = 'f27eba4260f9e58a6ed20c5c307fef5b';
  static const baseUrl = 'https://api.themoviedb.org/3';

  static Future<List<Movies>> fetchMovies(BuildContext context) async {
    final response = await http.get(Uri.parse('$baseUrl/movie/popular?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];

      Provider.of<MovieModel>(context, listen: false).setMovies(
        data.map((json) => Movies.fromJson(json)).toList(),
      );

      return data.map((json) => Movies.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }
}

