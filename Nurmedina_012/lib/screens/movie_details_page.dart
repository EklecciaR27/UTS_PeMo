import 'package:flutter/material.dart';
import 'package:main/screens/selectJadwal.dart';
import '../models/movies.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movies movie;

  MovieDetailsPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D1A),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image.asset(
                      'assets/${movie.img}',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, top: 30), // memberi jarak
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back_outlined, // icon arrow back
                      size: 35, // ukuran icon
                      color: Colors.white, // warna icon
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 30,
              child: Padding(
                padding: const EdgeInsets.only(left: 30),
                child: Text(
                  movie.title,
                  style: const TextStyle(
                    color: Color(0xFFC0CAAD),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 3.0,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 3, left: 30),
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
                  if (movie.rating == "B+")
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
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 60,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                              movie.category,
                              style: const TextStyle(
                                color: Color(0xFFC0CAAD),
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                          ),
                          const Text(
                              'Type',
                              style: TextStyle(
                                color: Color(0xFFC0CAAD),
                                fontSize: 13,
                              ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            movie.duration,
                            style: const TextStyle(
                              color: Color(0xFFC0CAAD),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Hour',
                            style: TextStyle(
                              color: Color(0xFFC0CAAD),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            movie.director,
                            style: const TextStyle(
                              color: Color(0xFFC0CAAD),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Director',
                            style: TextStyle(
                              color: Color(0xFFC0CAAD),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(
                            movie.rating,
                            style: const TextStyle(
                              color: Color(0xFFC0CAAD),
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'Rating',
                            style: TextStyle(
                              color: Color(0xFFC0CAAD),
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 30,
              child: const Padding(
                padding: EdgeInsets.only(left: 30),
                child: Text(
                  "Story Line",
                  style: TextStyle(
                    color: Color(0xFFC0CAAD),
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Text(
                  movie.storyLine,
                  style: const TextStyle(
                    color: Color(0xFFC0CAAD),
                    fontSize: 13,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://tse1.mm.bing.net/th?id=OIP.k5ibySapu-61GoJC0RIN1QHaDt&pid=Api&P=0&h=180'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 290,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 4, right: 200),
                          child: Container(
                            height: 27,
                            width: 130,
                            child: const Text(
                              'Star', // teks
                              style: TextStyle(
                                fontSize: 18, // ukuran teks
                                color: Color(0xFF8AB0AB),
                                fontWeight:
                                FontWeight.bold, // membuat teks tebal
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 20, bottom: 4),
                          child: Container(
                            height: 25,
                            width: double.infinity,
                            child: Text(
                              movie.star,
                              style: const TextStyle(
                                fontSize: 15, // ukuran teks
                                color: Color(0xFFC0CAAD),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 60,
              width: double.infinity,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              'https://tse1.mm.bing.net/th?id=OIP.k5ibySapu-61GoJC0RIN1QHaDt&pid=Api&P=0&h=180'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 290,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20, top: 4, right: 200),
                          child: Container(
                            height: 27,
                            width: 130,
                            child: const Text(
                              'Globe', // teks
                              style: TextStyle(
                                fontSize: 18, // ukuran teks
                                color: Color(0xFF8AB0AB),
                                fontWeight:
                                FontWeight.bold, // membuat teks tebal
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 20, bottom: 4),
                          child: Container(
                            height: 25,
                            width: double.infinity,
                            child: Text(
                              movie.globe,
                              style: const TextStyle(
                                fontSize: 15, // ukuran teks
                                color: Color(0xFFC0CAAD),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 50), // jarak atas
              child: ElevatedButton( // menggunakan elevated button
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context) => selectCategory()));
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, // warna teks button
                  backgroundColor: const Color(0xFF89B0AB), // warna latar belakang button
                  textStyle: const TextStyle(
                    fontSize: 18,  // ukuran teks
                  ),
                  fixedSize: const Size(230, 40), // ukuran button
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10), // ketumpulan sudut button
                  ),
                ),
                child: const Text('Continue to Book'), // teks didalam button
              ),
            ),
          ],
        ),
      ),
    );
  }
}
