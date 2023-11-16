// ignore_for_file: sized_box_for_whitespace, unused_import, annotate_overrides

import 'package:flutter/material.dart';
import 'package:main/auth.dart';
import '../widgets/bottom_nav.dart';
import 'home_movie_page.dart';
import '../models/user.dart' as my_models;
import 'package:provider/provider.dart';
import 'package:main/models/user_data_provider.dart';


class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({super.key});

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
String? fullName = '';

void initState() {
  super.initState();
  fetchFullName();
}

 void fetchFullName() async {
    try {
      // Menggunakan Provider.of untuk mendapatkan instance dari UserDataProvider
      var userProvider = Provider.of<UserDataProvider>(context, listen: false);
      // Mengambil data pengguna dari UserDataProvider
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

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D1A), // warna latar belak
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                height: 30,
                child: const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Confirm', // teks
                    style: TextStyle(
                      fontSize: 25, // ukuran teks
                      color: Color(0xFFC0CAAD), // warna teks
                      fontWeight: FontWeight.bold, // membuat teks tebal
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 30,
                child: const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'New Account', // teks
                    style: TextStyle(
                      fontSize: 25, // ukuran teks
                      color: Color(0xFFC0CAAD), // warna teks
                      fontWeight: FontWeight.bold, // membuat teks tebal
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Stack(
                children: [
                  // widget container  dengan tinggi 850 piksel dan lebar maksimum untuk menampung widget lainnya
                  Positioned(
                    child: Container(
                      height: 170,
                      width: double.infinity,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 130, // Lebar ikon "person add"
                      height: 130, // Tinggi ikon "person add"
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(
                            0xFF8AB0AB), // Warna latar belakang ikon "person add"
                      ),
                      child: const Icon(
                        Icons.person, // Ikon "person add"
                        color: Color(0xFF25403B), // Warna ikon
                        size: 100,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: (lebar - 40) / 2,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          // Tindakan yang akan diambil saat tombol ditekan
                        },
                        child: Container(
                          width: 40, // Lebar ikon "person add"
                          height: 40, // Tinggi ikon "person add"
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF25403B),
                          ),
                          child: const Icon(
                            Icons.add, // Ikon "person add"
                            color: Color(0xFF8AB0AB), // Warna ikon
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 30,
                child: const Center(
                  child: Text(
                    'Welcome,', // teks
                    style: TextStyle(
                      fontSize: 25, // ukuran teks
                      color: Color(0xFFC0CAAD), // warna teks
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 30,
                child: Center(
                  child: Text(
                    '$fullName', // Menggunakan fullName yang sudah diambil
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFC0CAAD),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Container(
                height: 80,
                width: lebar, // Menggunakan MediaQuery untuk lebar tombol
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Text(
                        'Yes, I am in',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF8AB0AB),
                          fontWeight: FontWeight.bold, // membuat teks tebal
                        ),
                      ),
                    ),
                    Expanded(
                      child:
                          Container(), // Untuk mengisi ruang kosong dan mendorong ikon ke kanan
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) =>
                              BottomNav(), // menggunakan AboutPage dari about_page.dart
                        ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 50, left: 50),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF8AB0AB),
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
