import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/models/topupAmount.dart';
import 'package:main/models/user.dart';

class TopupPage extends StatefulWidget {
  const TopupPage({Key? key, required this.email}) : super(key: key);

  final String? email; // Menggunakan tipe data String untuk email

  @override
  _TopupPageState createState() => _TopupPageState();
}

class _TopupPageState extends State<TopupPage> {
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _emailController = TextEditingController(); // Menambahkan controller untuk field email

  @override
  void dispose() {
    _amountController.dispose();
    _emailController.dispose(); // Memastikan untuk menghapus controller email
    super.dispose();
  }

  void _printLatestValueAmount() {
    print('Amount : ${_amountController.text}');
  }

  void _submitTopup() {
    double nominal = double.parse(_amountController.text);
    String email = _emailController.text; // Mengambil nilai dari controller email

    // Validasi agar tidak memasukkan data kosong ke Firestore
    if (nominal > 0 && email.isNotEmpty) {
      // Buat objek TopupAmount
      TopupAmount topupAmount = TopupAmount(
        nominal: nominal,
        email: email,
      );

      // Simpan data ke Firestore
      FirebaseFirestore.instance.collection('topup_amount').add(topupAmount.toMap());

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
                labelStyle:
                    TextStyle(color: Color.fromARGB(193, 80, 81, 81)),
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
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "Email.",
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Email",
                labelStyle:
                    TextStyle(color: Color.fromARGB(193, 80, 81, 81)),
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
              controller: _emailController,
            ),
          ),
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
