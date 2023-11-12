import 'package:flutter/widgets.dart';
import 'movie_category.dart';

List<MovieCategory> myCategory = [
    MovieCategory(
      imageCat: Image.asset(
        'assets/all.png', // Ganti dengan path gambar yang sesuai
        width: 35, // Ganti dengan lebar gambar yang diinginkan
        height: 35, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "All",
    ),
    MovieCategory(
      imageCat: Image.asset(
        'assets/drama.png', // Ganti dengan path gambar yang sesuai
        width: 32, // Ganti dengan lebar gambar yang diinginkan
        height: 32, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "Drama",
    ),
    MovieCategory(
      imageCat: Image.asset(
        'assets/horror.png', // Ganti dengan path gambar yang sesuai
        width: 28, // Ganti dengan lebar gambar yang diinginkan
        height: 28, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "Horror",
    ),
    MovieCategory(
      imageCat: Image.asset(
        'assets/war.png', // Ganti dengan path gambar yang sesuai
        width: 23, // Ganti dengan lebar gambar yang diinginkan
        height: 23, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "War",
    ),
    MovieCategory(
      imageCat: Image.asset(
        'assets/comedy.png', // Ganti dengan path gambar yang sesuai
        width: 30, // Ganti dengan lebar gambar yang diinginkan
        height: 30, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "Comedy",
    ),
    MovieCategory(
      imageCat: Image.asset(
        'assets/action.png', // Ganti dengan path gambar yang sesuai
        width: 30, // Ganti dengan lebar gambar yang diinginkan
        height: 30, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "Action",
    ),
  ];