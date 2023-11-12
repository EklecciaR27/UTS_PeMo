import 'package:flutter/material.dart';
import 'package:main/models/jadwal.dart';
import 'package:main/models/jadwal_data.dart';
import 'package:main/models/place.dart';
import 'package:main/models/place_data.dart';
import 'package:main/screens/select_seat.dart';

class selectCategory extends StatefulWidget {
  const selectCategory({super.key});

  @override
  State<selectCategory> createState() => _selectCategoryState();
}

class _selectCategoryState extends State<selectCategory> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 29, 26),
      body: Column(
        //MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start, //gunanya untuk ubah
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(17, 40, 0, 20),
            child: const Text(
              "Course Schedule",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 192, 203, 173),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: lebar,
            height: (tinggi - 500) / 2,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(top: 5),
              itemCount: timesCategory.length,
              itemBuilder: (_, i) {
                return Container(
                  padding: const EdgeInsets.only(left: 20),
                  child: CategoriTimesTile(catTimes: timesCategory[i]),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(17, 35, 0, 0),
            child: const Text(
              "Where To Watch ",
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 192, 203, 173),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            //padding: const EdgeInsets.only(right: 2),
            height: 350,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                  width: double.infinity,
                  child: const Column(
                    children: [
                      Text("XXI BIGMALL",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 137, 176, 171),
                          ),
                          textAlign: TextAlign.left),
                      //),
                    ],
                  ),
                ),
                Row(
                  children: categoryBm.map((CategoryPlace1 categoryPlace1) {
                    return CategoryPlaceTile1(catBM: categoryPlace1);
                  }).toList(),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(30, 15, 10, 0),
                  width: double.infinity,
                  height: 50,
                  child: const Column(
                    children: [
                      Text("XXI SAMARINDA SQUARE",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 137, 176, 171),
                          ),
                          textAlign: TextAlign.left),
                      //),
                    ],
                  ),
                ),
                Row(
                  children: categorySs.map((CategoryPlace2 categoryPlace2) {
                    return CategoryPlaceTile2(catSs: categoryPlace2);
                  }).toList(),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  width: double.infinity,
                  height: 25,
                  child: const Column(
                    children: [
                      Text("XXI CITY CENTRUM",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 137, 176, 171),
                          ),
                          textAlign: TextAlign.left),
                      //),
                    ],
                  ),
                ),
                Row(
                  children: categoryCc.map((CategoryPlace3 categoryPlace3) {
                    return CategoryPlaceTile3(catCc: categoryPlace3);
                  }).toList(),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(17, 10, 0, 0),
                child: const Text(
                  "Select Your Seat",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 192, 203, 173),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // Menangani klik pada ikon
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      // Gantilah MyDestinationScreen dengan halaman tujuan yang sesuai
                      return const SelectSeat();
                    }),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.fromLTRB(10, 15, 5, 0),
                  child: const Icon(
                    Icons.arrow_forward,
                    size: 30,
                    color: Color.fromARGB(255, 192, 203, 173),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CategoryPlaceTile1 extends StatelessWidget {
  final CategoryPlace1 catBM;

  CategoryPlaceTile1({
    Key? key,
    required this.catBM,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          // Handle the tap event here
          // You can navigate to the new screen or perform any other action
          print('Place tapped: ${catBM.tempat}');
        },
        // Handle the tap event here
        child: Container(
            width: 60,
            height: 70,
            margin: const EdgeInsets.fromLTRB(18, 0, 10, 0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 192, 203, 173),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  catBM.waktu,
                  style: const TextStyle(
                    fontSize: 18,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  "Hour",
                  style: TextStyle(
                    fontSize: 10,
                    color: Color.fromARGB(255, 62, 80, 92),
                  ),
                ),
              ],
            )));
  }
}

class CategoryPlaceTile2 extends StatelessWidget {
  final CategoryPlace2 catSs;

  CategoryPlaceTile2({
    Key? key,
    required this.catSs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 70,
        margin: const EdgeInsets.fromLTRB(18, 0, 10, 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 192, 203, 173),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              catSs.waktu,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Hour",
              style: TextStyle(
                fontSize: 10,
                color: Color.fromARGB(255, 62, 80, 92),
              ),
            ),
          ],
        ));
  }
}

class CategoryPlaceTile3 extends StatelessWidget {
  final CategoryPlace3 catCc;

  CategoryPlaceTile3({
    Key? key,
    required this.catCc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 60,
        height: 70,
        margin: const EdgeInsets.fromLTRB(18, 5, 10, 10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 192, 203, 173),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Text(
              catCc.waktu,
              style: const TextStyle(
                fontSize: 18,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "Hour",
              style: TextStyle(
                fontSize: 10,
                color: Color.fromARGB(255, 62, 80, 92),
              ),
            ),
          ],
        ));
  }
}

class CategoriTimesTile extends StatelessWidget {
  final CategoriTimes catTimes;

  CategoriTimesTile({
    Key? key,
    required this.catTimes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70, // Sesuaikan ukuran Container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50), // Radius gambar
        color: const Color(0xFF3E505B),
      ),
      padding: const EdgeInsets.all(
          10), // Tambahkan padding ke konten dalam Container
      child: Column(
        children: [
          Container(
            width: 50, // Sesuaikan ukuran Container
            height: 50, // Sesuaikan ukuran Container
            decoration: const BoxDecoration(
              shape: BoxShape.circle, // Membuat Container menjadi lingkaran
              color: Color(0xFF8AB0AB),
            ),
            child: Center(
              child: Text(
                catTimes.tanggal,
                style: const TextStyle(fontSize: 20), // Ukuran ikon
              ),
            ),
          ),
          const SizedBox(height: 10), // Berikan jarak antara ikon dan teks
          Text(
            catTimes.hari,
            style: const TextStyle(
              color: Color(0xFFC0CAAD),
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
