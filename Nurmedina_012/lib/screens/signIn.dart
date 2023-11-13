import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/auth.dart';
import 'package:main/screens/confirmation_page.dart';
import 'package:main/screens/signUp.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Page',
      theme: ThemeData(
        primarySwatch: Colors.green,
        scaffoldBackgroundColor: Colors.black,
      ),
      home: SignInForm(title: 'Input Review'),
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
  bool _loading = false;
  final _formKey = GlobalKey<FormState>();
  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    final email = _controllerEmail.value.text;
    final password = _controllerPW.value.text;
    setState(() => _loading = true);
    await Auth().login(email, password);
    setState(() => _loading = false);
  }

  // FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 300,
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
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: 310,
                    child: TextField(
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: Colors.white,
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
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
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
                        filled: false,
                        fillColor: Colors.white,
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
                          color: Colors.white,
                        ),
                        hintStyle: TextStyle(color: Colors.white),
                      ),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 250,
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
                          "Don't Have an Account?",
                          style: TextStyle(
                            color: Color(0xFF8AB0AB),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(
                                  title: 'Your Title Here',
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "Sign Up",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
