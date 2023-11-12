import 'package:flutter/material.dart';
import 'movie_details_page.dart';

class HomeMoviePage extends StatefulWidget {
  const HomeMoviePage({super.key});

  @override
  State<HomeMoviePage> createState() => _HomeMoviePageState();
}

class _HomeMoviePageState extends State<HomeMoviePage> {
  CategoryFilms? selectedCategory;
  @override
  void initState() {
    super.initState();
    selectedCategory = null;
  }

  void onCategorySelected(bool isSelected, CategoryFilms category) {
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


  static List<FanFavorites> myFanFavorites = [
    FanFavorites(
      imgFanFav: "posterFilm1.jpg",
      titleFanFav: "NOAH",
      durationFanFav: "1 hr 30 min",
      categoryFanFav: "Action",
      ratingFanFav: "A+",
      starFanFav: "Taisa Farmiga",
      globeFanFav: "IMDB",
      directorFanFav: "John",
      storyLineFanFav: "The film Titanic tells the story The film Titanic tells the story The film Titanic tells the story The film Titanic tells the story The film Titanic tells the story The film Titanic tells the story The film Titanic tells the story The film Titanic tells the story The film Titanic tells the story The film Titanic tells the story The film Titanic tells the story of the love between Jack Dawson (played by Leonardo DiCaprio) and Rose DeWitt Bukater (played by Kate Winslet) that begins aboard the luxurious ship, RMS Titanic",
    ),
    FanFavorites(
      imgFanFav: "posterFilm2.jpg",
      titleFanFav: "TABU",
      durationFanFav: "1 hr 25 min",
      categoryFanFav: "Horror",
      ratingFanFav: "A",
      starFanFav: "Indah Permatasari",
      globeFanFav: "IMDB",
      directorFanFav: "John",
      storyLineFanFav: "The film Titanic tells the story of the love between Jack Dawson (played by Leonardo DiCaprio) and Rose DeWitt Bukater (played by Kate Winslet) that begins aboard the luxurious ship, RMS Titanic",
    ),
    FanFavorites(
      imgFanFav: "posterFilm3.jpg",
      titleFanFav: "Titanic",
      durationFanFav: "3 hr 15 min",
      categoryFanFav: "Drama",
      ratingFanFav: "B",
      starFanFav: "Kendall Jenner",
      globeFanFav: "IMDB",
      directorFanFav: "John",
      storyLineFanFav: "The film Titanic tells the story of the love between Jack Dawson (played by Leonardo DiCaprio) and Rose DeWitt Bukater (played by Kate Winslet) that begins aboard the luxurious ship, RMS Titanic",
    ),
    FanFavorites(
      imgFanFav: "posterFilm4.jpg",
      titleFanFav: "Marvel",
      durationFanFav: "3 hr 15 min",
      categoryFanFav: "Drama",
      ratingFanFav: "C",
      starFanFav: "Kendall Jenner",
      globeFanFav: "IMDB",
      directorFanFav: "John",
      storyLineFanFav: "The film Titanic tells the story of the love between Jack Dawson (played by Leonardo DiCaprio) and Rose DeWitt Bukater (played by Kate Winslet) that begins aboard the luxurious ship, RMS Titanic",
    ),
  ];

  List<CategoryFilms> myCategory = [
    CategoryFilms(
      imageCat: Image.asset(
        'assets/all.png', // Ganti dengan path gambar yang sesuai
        width: 35, // Ganti dengan lebar gambar yang diinginkan
        height: 35, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "All",
    ),
    CategoryFilms(
      imageCat: Image.asset(
        'assets/drama.png', // Ganti dengan path gambar yang sesuai
        width: 32, // Ganti dengan lebar gambar yang diinginkan
        height: 32, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "Drama",
    ),
    CategoryFilms(
      imageCat: Image.asset(
        'assets/horror.png', // Ganti dengan path gambar yang sesuai
        width: 28, // Ganti dengan lebar gambar yang diinginkan
        height: 28, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "Horror",
    ),
    CategoryFilms(
      imageCat: Image.asset(
        'assets/war.png', // Ganti dengan path gambar yang sesuai
        width: 23, // Ganti dengan lebar gambar yang diinginkan
        height: 23, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "War",
    ),
    CategoryFilms(
      imageCat: Image.asset(
        'assets/comedy.png', // Ganti dengan path gambar yang sesuai
        width: 30, // Ganti dengan lebar gambar yang diinginkan
        height: 30, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "Comedy",
    ),
    CategoryFilms(
      imageCat: Image.asset(
        'assets/action.png', // Ganti dengan path gambar yang sesuai
        width: 30, // Ganti dengan lebar gambar yang diinginkan
        height: 30, // Ganti dengan tinggi gambar yang diinginkan
      ),
      titleCat: "Action",
    ),
  ];


  int currentIndex = 0; // penentu icon aktif bottom navigation bar

  // list menampung semua tujuan bottom navigation bar
  List<Widget> menuBottomNav = [
    const HomeMoviePage(),
    const Icon(
      Icons.category,
      color: Color(0xFF1A1D1A),
      size: 30, // Ukuran ikon
    ),
    const Icon(
      Icons.category,
      color: Color(0xFF1A1D1A),
      size: 30, // Ukuran ikon
    ),
  ];
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D1A), // warna latar belak
      bottomNavigationBar: BottomNavigationBar(
        // bottom navigation bar
        currentIndex:
            currentIndex, // index item yang aktif saat ini/yang terpilih
        backgroundColor: const Color(0xFF1A1D1A), // warna background
        onTap: (index) {
          // aksi saat ditekan
          setState(() {
            currentIndex = index; // memperbarui index
          });
        },
        items: const [
          // item-item bottom navigation bar
          BottomNavigationBarItem(
            // item pertama
            icon: Icon(Icons.movie_creation_outlined,
                color: Color(0xFF25403B), size: 30), // icon
            activeIcon: Icon(Icons.movie,
                color: Color(0xFF8AB0AB),
                size: 30), // warna icon saat aktif/terpilih
            label: "Movie", // label icon
          ),
          BottomNavigationBarItem(
            // item kedua
            icon: Icon(Icons.airplane_ticket_outlined,
                color: Color(0xFF25403B), size: 30),
            activeIcon: Icon(Icons.airplane_ticket,
                color: Color(0xFF8AB0AB),
                size: 30), // warna icon saat aktif/terpilih
            label: "My Tickets", // label icon
          ),
          BottomNavigationBarItem(
            // item ketiga
            icon:
                Icon(Icons.person, color: Color(0xFF25403B), size: 30), // icon
            activeIcon: Icon(Icons.person,
                color: Color(0xFF8AB0AB),
                size: 30), // warna icon saat aktif/terpilih
            label: "Profil", // label icon
          ),
        ],
        unselectedItemColor:
            const Color(0xFF25403B), // warna item yang tidak aktif
        selectedItemColor: const Color(0xFF8AB0AB), // warna icon saat aktif
      ),
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
                              child: const Text(
                                'Refal Hady', // teks
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
                              child: const Text(
                                'IDR 300.000', // teks
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
                child: selectedCategory == null || selectedCategory!.titleCat == 'All'
                    ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 5),
                  itemCount: myFanFavorites.length,
                  itemBuilder: (context, i) {
                    return Container(
                      padding: const EdgeInsets.only(left: 20),
                      child: fanFavoritesTile(fanfav: myFanFavorites[i]),
                    );
                  },
                )
                    : myFanFavorites.any((fav) => fav.categoryFanFav == selectedCategory!.titleCat)
                    ? ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 5),
                  itemCount: myFanFavorites.length,
                  itemBuilder: (context, i) {
                    if (myFanFavorites[i].categoryFanFav == selectedCategory!.titleCat) {
                      return Container(
                        padding: const EdgeInsets.only(left: 20),
                        child: fanFavoritesTile(fanfav: myFanFavorites[i]),
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
                      child: categoryFilmsTile(
                        catFilms: myCategory[i],
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

class fanFavoritesTile extends StatelessWidget {
  final FanFavorites fanfav;

  fanFavoritesTile({
    Key? key,
    required this.fanfav,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // widget container review movie
    return  GestureDetector(
        onTap: () {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MovieDetailsPage(fanfav: fanfav),
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
                'assets/${fanfav.imgFanFav}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            width: 120,
            height: 20,
            child: Text(
              fanfav.titleFanFav,
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
                if (fanfav.ratingFanFav == "A+")
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
                if (fanfav.ratingFanFav == "A")
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
                if (fanfav.ratingFanFav == "B+")
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
                if (fanfav.ratingFanFav == "B")
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
                if (fanfav.ratingFanFav == "C")
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

class categoryFilmsTile extends StatelessWidget {
  final CategoryFilms catFilms;
  final bool isSelected;
  final Function(bool isSelected) onCategorySelected;

  categoryFilmsTile({
    Key? key,
    required this.catFilms,
    required this.isSelected,
    required this.onCategorySelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategorySelected(!isSelected);
      },
      child: Container(
        width: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          color: isSelected ? const Color(0x803E505A) : const Color(0xFF3E505B),
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? const Color(0xFF506868) : const Color(0xFF8AB0AB),
              ),
              child: Center(
                child: catFilms.imageCat, // Menggunakan gambar langsung
              ),

            ),
            const SizedBox(height: 10),
            Text(
              catFilms.titleCat,
              style: TextStyle(
                color: isSelected ? const Color(0xFF9BA594) : const Color(0xFFC0CAAD),
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}



class FanFavorites {
  String imgFanFav = "";
  String titleFanFav = "";
  String durationFanFav = "";
  String categoryFanFav = "";
  String ratingFanFav = "";
  String starFanFav = "";
  String globeFanFav = "";
  String directorFanFav = "";
  String storyLineFanFav = "";

  FanFavorites({
    required this.imgFanFav,
    required this.titleFanFav,
    required this.durationFanFav,
    required this.categoryFanFav,
    required this.ratingFanFav,
    required this.starFanFav,
    required this.globeFanFav,
    required this.directorFanFav,
    required this.storyLineFanFav,
  });
}

class CategoryFilms {
  final Image imageCat;
  final String titleCat;

  CategoryFilms({
    required this.imageCat,
    required this.titleCat,
  });
}
