import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/screens/confirmation_page.dart';

import 'signUp.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Page',
      theme: ThemeData(
        primarySwatch: Colors.green, // You missed a comma here
        scaffoldBackgroundColor: Colors.black,
      ),
      home: SignInForm(title: 'Input Review'), // No need for 'const' here
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignInFormState createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPW = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;
  CollectionReference dataUser =
  FirebaseFirestore.instance.collection("data_user");



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Add Review"),
      // ),
      body: Stack(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
              width: 700,
              height: 900,
              padding: EdgeInsets.only(left: 30, top: 20),
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                "Welcome Back, \nto Flutix",
                style: TextStyle(
                    color: Color(0xFFC0CBAD),
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              )),
          Positioned(
            top: 300, // Mengatur posisi ke atas
            right: 0,
            left: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFF26413C),
              ),
              width: 500,
              height: 900,
              child: Column(
                children: [
                  Positioned(
                      child: Container(
                    margin: EdgeInsets.only(right: 230, top: 30),
                    child: Text(
                      "Sign In",
                      style: TextStyle(
                          color: Color(0xFFC0CBAD),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  )),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 310,
                    child: TextField(
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        filled: false, // latar belakang
                        fillColor: Colors.white, // warna latar belakang
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFF8AB0AB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: "Email",
                        hintText: "Email",
                        labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 310,
                    child: TextField(
                      controller: _controllerPW,
                      decoration: InputDecoration(
                        filled: false, // latar belakang
                        fillColor: Colors.white, // warna latar belakang
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFF8AB0AB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: "Password",
                        hintText: "Password",
                        labelStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 250, // Atur lebar sesuai kebutuhan Anda
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmationPage()));
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: BorderSide(
                                color: Color(0xFF8AB0AB),
                                width: 2.0,
                              )
                              // Radius sudut disesuaikan sesuai kebutuhan Anda
                              ),
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.white), // Warna teks
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF8AB0AB)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 8, height: 8),
                          Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't Have an Account?",
                          style: TextStyle(
                              color: Color(0xFF8AB0AB),
                              fontSize: 17,
                              fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SignUpPage(title: 'Your Title Here'),
                                ),
                              );
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: SignInPage(),
//   ));
// }
