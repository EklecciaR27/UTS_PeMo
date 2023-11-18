import 'package:flutter/material.dart';
import 'package:main/auth.dart';
import 'package:main/models/user.dart';
import 'package:provider/provider.dart';
import '../models/user_data.dart';
import 'signIn.dart';

class Regis extends StatefulWidget {
  const Regis({super.key});

  @override
  State<Regis> createState() => _RegisState();
}

class _RegisState extends State<Regis> {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlFullName = TextEditingController();
  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();
  final TextEditingController _ctrlConfirmPassword = TextEditingController();

  Auth _auth = Auth(); // Create an instance of the Auth class

  handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final fullName = _ctrlFullName.value.text;
    final email = _ctrlEmail.value.text;
    final password = _ctrlPassword.value.text;
    final confirmPassword = _ctrlConfirmPassword.value.text;
    final foto = '';

    if (password != confirmPassword) {
      // Passwords do not match
      // Handle this case as needed, e.g., show an error message.
      return;
    }

    setState(() => _loading = true);

    try {
      // Call the regis method with only email and password
      await _auth.regis(fullName, email, password, confirmPassword, foto);

      // Create a new User object
      User newUser = User(
        fullName: fullName,
        email: email,
        password: password,
        confirmPassword: confirmPassword,
        foto: 'Nanti', // Placeholder value
      );

      // Add the new user to the UserData using Provider
      Provider.of<UserData>(context, listen: false).addUser(newUser);

      // After successful registration, you can perform other actions here
    } catch (e) {
      // Handle registration errors here
      print('Registration failed: $e');
      // You can add error handling logic or display error messages to the user here
    } finally {
      setState(() => _loading = false);
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
            padding: EdgeInsets.only(left: 10, bottom: 500),
            margin: EdgeInsets.only(bottom: 10),
            child: Image.asset(
              'assets/flutix.png',
              width: 200,
              height: 200,
            ),
          ),
          Positioned(
            top: 200,
            right: 0,
            left: 1,
            child: Container(
              width: 360,
              height: 600,
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
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        TextFormField(
                          controller: _ctrlFullName,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name';
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
                        SizedBox(height: 30),
                        TextFormField(
                          controller: _ctrlEmail,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
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
                        SizedBox(height: 30),
                        TextFormField(
                          controller: _ctrlPassword,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
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
                        SizedBox(height: 30),
                        TextFormField(
                          controller: _ctrlConfirmPassword,
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
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
                        SizedBox(height: 30),
                        ElevatedButton(
                          onPressed: () => handleSubmit(),
                          child: _loading
                              ? SizedBox(
                                  width: 250,
                                  height: 40,
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2,
                                  ),
                                )
                              : Text("Submit"),
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
                          height: 30,
                        ),
                      Row(
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
                                      builder: (context) => Login()));
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
                    ],
                    ),
                  )),
            ),
          )
        ],
      ),
    );
  }
}