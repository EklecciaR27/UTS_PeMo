import 'package:flutter/material.dart';
import 'package:main/auth.dart';
import 'package:main/models/user_data.dart';
import 'package:provider/provider.dart';
import 'confirmation_page.dart';
import 'signUp.dart';
import '../models/user.dart' as my_models;

class Login extends StatefulWidget { //class login w/ statefull = bisa berubah
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false; //progres defaulnya false 

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlEmail = TextEditingController(); //textfield
  final TextEditingController _ctrlPassword = TextEditingController();

  handleSubmit() async {//method submit
  if (!_formKey.currentState!.validate()) return; //cek apakah formulir valid
  final email = _ctrlEmail.value.text; //ambil nilai inputan texfield
  final password = _ctrlPassword.value.text;
  setState(() => _loading = true); //memperlihatkan progres apk

  try {
    //proses login w metode login di auth yg disimpan dalam loggedInUser
    my_models.User? loggedInUser = await Provider.of<Auth>(context, listen: false).login(email, password);
    
    //cek apakah loggedInUser tdk null
    if (loggedInUser != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Welcome ${loggedInUser.fullName}'), //allert 
        ),

      );

      // proses menyimpan data user yang login ke dalam data loka UserData tdi w/ method addUser yg berisi loggedInUser
      Provider.of<UserData>(context, listen: false).addUser(loggedInUser);

      // navigasi ke halaman konfirmasi atau halaman lain yang sesuai
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConfirmationPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to login. Please check your credentials."),//jika loggedInUser null
        ),
      );
    }
  } catch (e) {
    print("Error: $e");

    String errorMessage = "Failed to login. Please check your credentials.";
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  } finally {//jika try sudah
    setState(() => _loading = false); //progres di false kan lagi
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          color: Colors.black,
          width: 700,
          height: 900,
          child: Container(
            margin: EdgeInsets.only(top: 50, left: 42),
            child: Text(
              "Welcome Back.\nto Flutix",
              style: TextStyle(
                fontSize: 25, // ukuran teks
                color: Color(0xFFC0CAAD), // warna teks
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        Positioned(
          top: 300,
          right: 0,
          left: 1,
          child: Container(
            width: 360,
            height: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFF26413C),
                  Color.fromARGB(255, 0, 0, 0),
                ],
              ),
            ),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
                child: Column(
                  children: [
                    Container(
                      //margin: EdgeInsets.only(right: 265),
                      child: const Text(
                        "Sign In",
                        style: TextStyle(
                          fontSize: 25, // ukuran teks
                          color: Color(0xFFC0CAAD), // warna teks
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      alignment: Alignment.topLeft,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      controller: _ctrlEmail,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan Masukkan Email Anda';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: false, // latar belakang
                        fillColor: Colors.white, // warna latar belakang
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Color(0xFF8AB0AB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
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
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: _ctrlPassword,
                      obscureText: true,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Silakan Masukkan Password Anda';
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        filled: false, // latar belakang
                        fillColor: Colors.white, // warna latar belakang
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide(
                            color: Color(0xFF8AB0AB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
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
                    SizedBox(height: 35),
                        ElevatedButton(
                          onPressed: () => handleSubmit(),
                          child: _loading
                              ? SizedBox(
                                  width: 250,
                                  height: 40,
                                  
                                )
                              : Text("Sign In"),
                          style: ButtonStyle(
                            fixedSize: MaterialStateProperty.all<Size>(
                              Size(250, 40),
                            ),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                side: BorderSide(
                                  color: Color(0xFF8AB0AB),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF8AB0AB)),
                          ),
                        ),
                         SizedBox(
                          height: 20,
                        ),
                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an Account?",
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
                                      builder: (context) => Regis()));
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
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    ));
  }
}