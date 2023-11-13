import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/auth.dart';
import 'package:main/models/user.dart';
import 'package:main/models/user_data.dart';
import 'signIn.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

  class _SignUpPageState extends State<SignUpPage> {
    
    bool _loading = false;
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _controllerFullName = TextEditingController();
    final TextEditingController _controllerEmail = TextEditingController();
    final TextEditingController _controllerPW = TextEditingController();
    final TextEditingController _controllerKonfirm = TextEditingController();

    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference dataUser =
    FirebaseFirestore.instance.collection("data_user");
    userData userDataInstance = userData();
// void handleSubmit() async {
//   if (!_formKey.currentState!.validate()) return;

//   final fullName = _controllerFullName.value.text;
//   final email = _controllerEmail.value.text;
//   final password = _controllerPW.value.text;
//   final confirmPassword = _controllerKonfirm.value.text;

//   setState(() => _loading = true);
//   await Auth().regis(fullName,email, password, confirmPassword);
//   setState(() => _loading = false);
// }
void handleSubmit() async {
  if (_formKey.currentState == null) return;

  if (!_formKey.currentState!.validate()) return;

  final fullName = _controllerFullName.text;
  final email = _controllerEmail.text;
  final password = _controllerPW.text;
  final confirmPassword = _controllerKonfirm.text;

  setState(() => _loading = true);

  if (password != confirmPassword) {
    // Handle password mismatch, maybe show an error message to the user
    setState(() => _loading = false);
    return;
  }

  User newUser = User(
    fullName: fullName,
    email: email,
    password: password,
    confirmPassword: confirmPassword, 
    foto: null,
    // You might also handle the Image here if needed
  );

  // If regis() takes email and password as arguments in Auth class
  await Auth().regis(newUser.email, newUser.password);
  setState(() => _loading = false);
}

    
@override
Widget build(BuildContext context) {
  return Scaffold(
    // appBar: AppBar(
    //   title: Text("Add Review"),
    // ),
    body: Stack(
      children: <Widget>[
        Container(
          width: 700,
          height: 900,
          padding: EdgeInsets.only(left: 10, bottom: 500),
          margin: EdgeInsets.only(bottom: 10),
          child: Image.asset(
            'assets/flutix.png',
            width: 200,
            height: 200,
          ),
        ),
        Positioned(
          top: 160, // Mengatur posisi ke atas
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
                SizedBox(
                  height: 60,
                ),
                Container(
                  width: 310,
                  child: TextField(
                    controller: _controllerFullName,
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
                      labelText: "Full Name",
                      hintText: "Full Name",
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
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: 310,
                  child: TextField(
                    controller: _controllerKonfirm,
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
                      labelText: "Confirm Password",
                      hintText: "Confirm Password",
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
                    onPressed: () => handleSubmit(),
                    child: _loading
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : Text("Submit"),
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
                        "already have an Account?",
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
                                    builder: (context) => SignInPage()));
                          },
                          child: Text(
                            "Sign in",
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
//     home: SignUpPage(),
//   ));
// }

