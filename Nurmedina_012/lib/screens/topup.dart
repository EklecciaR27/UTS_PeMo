import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/auth.dart';
import 'package:main/models/topupAmount.dart';
import 'package:main/models/user.dart';
import 'package:main/models/user_data_provider.dart';
import 'package:provider/provider.dart';
import '../models/user.dart' as my_models;

class TopupPage extends StatefulWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  _TopupPageState createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  final TextEditingController _amountController = TextEditingController();
  //final TextEditingController _emailController = TextEditingController(); // Menambahkan controller untuk field email

  @override
  void dispose() {
    _amountController.dispose();
    //_emailController.dispose(); // Memastikan untuk menghapus controller email
    super.dispose();
  }

  void _printLatestValueAmount() {
    print('Amount : ${_amountController.text}');
  }

  String email = '';

  void _submitTopup() {
    double nominal = double.parse(_amountController.text);

    void fetchEmail() async {
      try {
        // Menggunakan Provider.of untuk mendapatkan instance dari UserDataProvider
        var userProvider =
            Provider.of<UserDataProvider>(context, listen: false);
        // Mengambil data pengguna dari UserDataProvider
        var user = userProvider.myUsers.first;

        if (user != null) {
          setState(() {
            email = user.email;
          });
        }
      } catch (e) {
        print('Error fetching email: $e');
      }

      void initState() {
        super.initState();
        fetchEmail();
      }
    }

    // Validasi agar tidak memasukkan data kosong ke Firestore
    if (nominal > 0 && email != 0) {
      // Buat objek TopupAmount
      TopupAmount topupAmount = TopupAmount(
        nominal: nominal,
        email: email,
      );

      // Simpan data ke Firestore
      FirebaseFirestore.instance
          .collection('topup_amount')
          .add(topupAmount.toMap());

      // Tambahkan logika lain yang diperlukan setelah topup
    } else {
      // Tampilkan pesan kesalahan jika data tidak lengkap
      // TODO: Sesuaikan pesan kesalahan sesuai kebutuhan
      print("Nominal dan email harus diisi");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  onPressed: () {},
                  child: Container(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 289,
              height: 166,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Wallet Card.PNG"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                Text(
                  "Amount : ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 138, 176, 171),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "IDR.",
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Amount",
                labelStyle: TextStyle(color: Color.fromARGB(193, 80, 81, 81)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(193, 1, 143, 122),
                    width: 1.0,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 138, 176, 171),
                    width: 1.0,
                  ),
                ),
              ),
              controller: _amountController,
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                Text(
                  "Email : ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 138, 176, 171),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // SizedBox(
          //   width: 300,
          //   child: TextFormField(
          //     decoration: InputDecoration(
          //       hintText: "Email.",
          //       hintStyle: TextStyle(color: Colors.grey),
          //       labelText: "Email",
          //       labelStyle:
          //           TextStyle(color: Color.fromARGB(193, 80, 81, 81)),
          //       enabledBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(
          //           color: Color.fromARGB(193, 1, 143, 122),
          //           width: 1.0,
          //         ),
          //       ),
          //       focusedBorder: UnderlineInputBorder(
          //         borderSide: BorderSide(
          //           color: const Color.fromARGB(255, 138, 176, 171),
          //           width: 1.0,
          //         ),
          //       ),
          //     ),
          //     controller: _emailController,
          //   ),
          // ),
          SizedBox(
            height: 40,
            width: 140,
            child: ElevatedButton(
              onPressed: _submitTopup,
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromARGB(255, 138, 176, 171),
              ),
              child: Text(
                'Top Up Now',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
