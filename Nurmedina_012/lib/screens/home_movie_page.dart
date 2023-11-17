// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:main/models/movie_category.dart';
import 'package:provider/provider.dart';
import '../models/movie_category_data.dart';
import '../models/movies_data.dart';
import '../models/topup_amount_data.dart';
import '../models/topup_service.dart';
import '../models/user_data.dart';
import '../widgets/movie_category_tile.dart';
import '../widgets/movies_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage({super.key});

  @override
  State<HomeMoviePage> createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  late TopupService _topupService;
  // late UserService _userService;

  String? fullName = '';
  double? nominal = 0.0;

  int currentIndex = 0;
  MovieCategory? selectedCategory;

  @override
  void initState() {
    super.initState();
    _topupService = TopupService();
    //  _userService = UserService();
    selectedCategory = null;
    fetchData(); // Combine both fetching operations in a new method
  }

  void onCategorySelected(bool isSelected, MovieCategory category) {
    if (category.titleCat == "All") {
      setState(() {
        selectedCategory = null;
      });
    } else if (isSelected) {
      setState(() {
        selectedCategory = category;
      });
    }
  }

  void fetchData() async {
    fetchFullName();
    fetchNominalTopUp();
  }

  void fetchFullName() async {
    try {
      var userProvider = Provider.of<UserData>(context, listen: false);
      var user = userProvider.myUsers.first;

      if (user != null) {
        setState(() {
          fullName = user.fullName;
        });
      }
    } catch (e) {
      print('Error fetching full name: $e');
    }
  }

  void fetchNominalTopUp() async {
    try {
      var user = _auth.currentUser;
      var email = user?.email ?? '';

      var topUp = await _topupService.getNominalTopUp(email);

      if (topUp != null) {
        // Access TopupData using Provider to update state
        Provider.of<TopupData>(context, listen: false).updateTopUp(topUp);

        setState(() {
          nominal = topUp.nominal;
        });
      }
    } catch (e) {
      print('Error fetching top-up amount: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D1A), // warna latar belak
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 15),
              Container(
                height: 100,
                width: lebar,
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://tse1.mm.bing.net/th?id=OIP.k5ibySapu-61GoJC0RIN1QHaDt&pid=Api&P=0&h=180'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: 100,
                      width: lebar - 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Container(
                              height: 27,
                              width: lebar - 130,
                              child: Text(
                                '$fullName',
                                style: TextStyle(
                                  fontSize: 20, // ukuran teks
                                  color: Color(0xFF8AB0AB),
                                  fontWeight:
                                      FontWeight.bold, // membuat teks tebal
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 25),
                            child: Container(
                              height: 25,
                              width: lebar - 130,
                              child: Text(
                                '$nominal',
                                style: TextStyle(
                                  fontSize: 18, // ukuran teks
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
              const SizedBox(height: 15),
              Container(
                height: 25,
                width: lebar,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'NOW PLAYING', // teks
                    style: TextStyle(
                      fontSize: 18, // ukuran teks
                      color: Color(0xFF8AB0AB),
                      fontWeight: FontWeight.bold, // membuat teks tebal
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: lebar,
                height: (tinggi - 280) / 2,
                child: selectedCategory == null ||
                        selectedCategory!.titleCat == 'All'
                    ? ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: myMovies.length,
                        itemBuilder: (context, i) {
                          return Container(
                            padding: const EdgeInsets.only(left: 20),
                            child: MovieTile(movie: myMovies[i]),
                          );
                        },
                      )
                    : myMovies.any(
                            (fav) => fav.category == selectedCategory!.titleCat)
                        ? ListView.builder(
                            scrollDirection: Axis.horizontal,
                            padding: const EdgeInsets.only(top: 5),
                            itemCount: myMovies.length,
                            itemBuilder: (context, i) {
                              if (myMovies[i].category ==
                                  selectedCategory!.titleCat) {
                                return Container(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: MovieTile(movie: myMovies[i]),
                                );
                              } else {
                                return const SizedBox();
                              }
                            },
                          )
                        : const Center(
                            child: Text(
                              'No matches.', // Display this text when there are no matches
                              style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFFC0CAAD),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
              ),
              const SizedBox(height: 15),
              Container(
                height: 20,
                width: lebar,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'MOVIE CATEGORY',
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFF8AB0AB),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              Container(
                width: lebar,
                height: (tinggi - 500) / 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 5),
                  itemCount: myCategory.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: MovieCategoryTile(
                        movieCat: myCategory[i],
                        isSelected: myCategory[i] == selectedCategory,
                        onCategorySelected: (bool isSelected) {
                          onCategorySelected(isSelected, myCategory[i]);
                        },
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 30),
              Container(
                height: tinggi / 2 + 50,
                width: lebar,
                color: const Color(0xFF26413C),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 10, right: 190),
                      child: Text(
                        'Coming Soon', // teks
                        style: TextStyle(
                          fontSize: 20, // ukuran teks
                          color: Color(0xFF8AB0AB),
                          fontWeight: FontWeight.bold, // membuat teks tebal
                        ),
                      ),
                    ),
                    Container(
                      width: lebar,
                      height: (tinggi - 400) / 2,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(top: 5),
                        itemCount: 4, // Jumlah item yang ingin ditampilkan
                        itemBuilder: (context, index) {
                          final adjustedIndex = index + 1;
                          // Di sini Anda bisa membuat widget gambar sesuai dengan indeks
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width:
                                  100, // Sesuaikan ukuran Container sesuai kebutuhan Anda
                              height:
                                  300, // Sesuaikan ukuran Container sesuai kebutuhan Anda
                              child: Image.asset(
                                'assets/posterFilm$adjustedIndex.jpg', // Ganti dengan path gambar sesuai dengan struktur Anda
                                fit: BoxFit
                                    .cover, // Mengatur gambar agar sesuai dengan cover
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Stack(
                      children: [
                        Container(
                          height: 120,
                          width: lebar - 40,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(20), // Radius gambar
                            color: const Color(0xFF8AB0AB),
                          ),
                        ),
                        const Positioned(
                          left: 40,
                          top: 20,
                          child: Text(
                            'Holiday Promo',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color(0xFF1A1D1A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 75,
                          left: 40,
                          child: Text(
                            'Min. Four User',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 20,
                          left: 225,
                          child: Container(
                            // Atur properti Container sesuai kebutuhan
                            width: 50,
                            height: 50,
                            child: Image.asset(
                              'assets/discount.PNG',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const Positioned(
                          top: 85,
                          left: 215,
                          child: Text(
                            'View Details',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFF1A1D1A),
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
