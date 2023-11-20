import 'package:flutter/widgets.dart';
import 'movie_category.dart';

List<MovieCategory> myCategory = [
    MovieCategory(
      imageCat: Image.asset(
        'assets/all.png', 
        width: 35, 
        height: 35, 
      ),
      titleCat: "All",
    ),
    MovieCategory(
      imageCat: Image.asset(
        'assets/drama.png', 
        width: 32, 
        height: 32, 
      ),
      titleCat: "Drama",
    ),
    MovieCategory(
      imageCat: Image.asset(
        'assets/horror.png', 
        width: 28, 
        height: 28, 
      ),
      titleCat: "Horror",
    ),
    MovieCategory(
      imageCat: Image.asset(
        'assets/war.png', 
        width: 23, 
        height: 23, 
      ),
      titleCat: "War",
    ),
    MovieCategory(
      imageCat: Image.asset(
        'assets/comedy.png', 
        width: 30, 
        height: 30, 
      ),
      titleCat: "Comedy",
    ),
    MovieCategory(
      imageCat: Image.asset(
        'assets/action.png', 
        width: 30, 
        height: 30, 
      ),
      titleCat: "Action",
    ),
  ];