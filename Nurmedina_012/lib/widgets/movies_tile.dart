import 'package:flutter/material.dart';
import '../models/movies.dart';
import '../screens/movie_details_page.dart';

class MovieTile extends StatelessWidget {
  final Movies movie;

  MovieTile({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // widget container review movie
    return  GestureDetector(
        onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(movie: movie),
        ),
      );
    },
    child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // widget gambar
          Container(
            width: 120,
            height: 170,
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color(0xFF8AB0AB),
                width: 5, // Lebar border
              ),
              borderRadius: BorderRadius.circular(10), // Radius gambar
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5), // Radius gambar
              child: Image.asset(
                'assets/${movie.img}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 120,
            height: 20,
            child: Text(
              movie.title,
              style: const TextStyle(
                color: Color(0xFFC0CAAD),
                fontSize: 15,
                fontWeight: FontWeight.bold,
                letterSpacing: 3.0,
              ),
            ),
          ),
          const SizedBox(height: 3),
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 0),
            child: Row(
              children: [
                if (movie.rating == "A+")
                  Row(
                    children: List.generate(
                      5,
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                    ),
                  ),
                if (movie.rating == "A")
                  Row(
                    children: List.generate(
                      4,
                      (index) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                    )..add(
                        const Icon(
                          Icons.star_border_outlined,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ),
                  ),
                if (movie.rating== "B+")
                  Row(
                    children: [
                      ...List.generate(
                        3,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ),
                      ...List.generate(
                        2,
                        (index) => const Icon(
                          Icons.star_border_outlined,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                if (movie.rating == "B")
                  Row(
                    children: [
                      ...List.generate(
                        2,
                        (index) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ),
                      ...List.generate(
                        3,
                        (index) => const Icon(
                          Icons.star_border_outlined,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                if (movie.rating == "C")
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 15,
                      ),
                      ...List.generate(
                        4,
                        (index) => const Icon(
                          Icons.star_border_outlined,
                          color: Colors.amber,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    ),
    );
  }
}