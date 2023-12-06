import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/models/topupAmount.dart';
import 'package:main/models/user_data.dart';
import 'package:provider/provider.dart';
import '../models/topup_amount_data.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({Key? key}) : super(key: key);

  @override
  _TopupPageState createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  final TextEditingController _amountController = TextEditingController();
  //final TextEditingController _emailController = TextEditingController(); // Menambahkan controller untuk field email
String fullName = '';
String email = '';


  @override
  void dispose() {
    _amountController.dispose();
    //_emailController.dispose(); // Memastikan untuk menghapus controller email
    super.dispose();
  }

  void _printLatestValueAmount() {
    print('Amount : ${_amountController.text}');
  }

void _submitTopup(BuildContext context) async {
  double nominal = double.tryParse(_amountController.text) ?? 0.0;

  if (nominal > 0) {
    // Akses provider untuk menambahkan top-up baru
    TopupData topupData = Provider.of<TopupData>(context, listen: false);

    // Periksa apakah email sudah ada di dalam provider
    // bool emailExists = topupData.myTopups.any((topup) => topup.email == email);

    // if (emailExists) {
    //   // Jika email sudah ada di provider, tambahkan nominal
    //   TopupAmount existingTopup = topupData.myTopups.firstWhere((topup) => topup.email == email);
    //   double newNominal = existingTopup.nominal + nominal;

    //   // Perbarui top-up yang sudah ada di dalam provider
    //   topupData.updateTopUp(TopupAmount(
    //     nominal: newNominal,
    //     email: existingTopup.email,
    //     fullName: existingTopup.fullName,
    //   ));

    //   // Perbarui data di Firestore
    //   await FirebaseFirestore.instance
    //       .collection('topup_amount')
    //       .doc(existingTopup.email)
    //       .update({'nominal': newNominal});
    // } else {
    //   // Jika email belum ada di provider, cek di Firestore
      DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection('topup_amount')
          .doc(email)
          .get();

      if (documentSnapshot.exists) {
        // Jika email sudah ada di Firestore, dapatkan nominal yang ada
        double existingNominal = documentSnapshot['nominal'] ?? 0.0;
        double newNominal = existingNominal + nominal;

        // Perbarui data di Firestore
        await FirebaseFirestore.instance
            .collection('topup_amount')
            .doc(email)
            .update({'nominal': newNominal});

        // Tambahkan top-up baru ke dalam provider
        topupData.addTopUp(TopupAmount(
          nominal: newNominal,
          email: email,
          fullName: fullName,
        ));
      } else {
        // Jika email belum ada di Firestore, tambahkan top-up baru ke dalam provider dan Firestore
        TopupAmount newTopup = TopupAmount(
          nominal: nominal,
          email: email,
          fullName: fullName,
        );

        topupData.addTopUp(newTopup);

        // Tambahkan data baru ke Firestore
        await FirebaseFirestore.instance
            .collection('topup_amount')
            .doc(email)
            .set(newTopup.toMap());
      }
    }
  // } else {
  //   // Tangani kesalahan validasi
  //   print("Nominal harus lebih dari 0");
  // }
}


    void initState() {
        super.initState();
        fetchEmail();
        fetchFullName();
      }
    void fetchEmail() async {
    try {
      var userProvider = Provider.of<UserData>(context, listen: false);
      // Mengambil data pengguna dari UserDataProvider
      var user = userProvider.myUsers.first;

      if (user != null) {
        setState(() {
          email = user.email;
        });
      }
    } catch (e) {
      print('Error fetching full name: $e');
    }
  }

   void fetchFullName() async {
    try {
      // Menggunakan Provider.of untuk mendapatkan instance dari UserDataProvider
      var userProvider = Provider.of<UserData>(context, listen: false);
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
                  onPressed: () {
                      Navigator.pop(context);
                    },
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
                  "Email : $email",
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
              style: TextStyle(color: Colors.white),
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
              onPressed: (){
                _submitTopup(context);
              },
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
