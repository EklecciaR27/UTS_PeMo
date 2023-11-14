import 'package:flutter/material.dart';

import 'signIn.dart';
import 'signUp.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
//inisialisasi
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black, //warna latar belakang
      body: Container(
        width: lebar,
        height: tinggi,
        child: Column(
          children: [
            // Icon bloomthinc
            SizedBox(
              height: 80,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 0),
              margin: EdgeInsets.only(top: 0),
              child: Image.asset(
                'assets/flutix1.png',
                width: 350,
                height: 350,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(bottom: 50, left: 60),
              child: Row(
                children: [
                  Text(
                    "Watch a New Movie Much \n\t\t\tEasier than any Before",
                    style: TextStyle(
                      color: Color(0xFFC0CBAD),
                      fontSize: 20,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 40),
            Container(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          Regis(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF8AB0AB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  "Sign In to My Account",
                  style: TextStyle(color: Color(0xFF8AB0AB)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
