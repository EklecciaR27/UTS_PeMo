// login.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/auth.dart'; 
import 'confirmation_page.dart';
import 'signUp.dart';
import 'package:main/models/user_data_provider.dart';
import 'package:provider/provider.dart';
import '../models/user.dart' as my_models;


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _loading = false;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _ctrlEmail = TextEditingController();
  final TextEditingController _ctrlPassword = TextEditingController();

handleSubmit() async {
  if (!_formKey.currentState!.validate()) return;
  final email = _ctrlEmail.value.text;
  final password = _ctrlPassword.value.text;
  setState(() => _loading = true);

  try {
    // Menggunakan Provider.of untuk mendapatkan instance dari AuthProvider
    my_models.User? loggedInUser = await Provider.of<Auth>(context, listen: false).login(email, password);
    

    if (loggedInUser != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Anda adalah: ${loggedInUser.fullName}'),
        ),

      );

      // Menggunakan Provider.of untuk mengakses UserDataProvider dan menambahkan user
      Provider.of<UserDataProvider>(context, listen: false).addUser(loggedInUser);

      // Navigasi ke halaman konfirmasi atau halaman lain yang sesuai
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ConfirmationPage()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Failed to login. Please check your credentials."),
        ),
      );
    }
  } catch (e) {
    print("Error: $e");

    String errorMessage = "Failed to login. Please check your credentials.";

    // ...

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(errorMessage),
      ),
    );
  } finally {
    setState(() => _loading = false);
  }
}




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _ctrlEmail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan Masukkan Email Anda';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _ctrlPassword,
                  obscureText: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Silakan Masukkan Password Anda';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
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
                      : const Text("Submit"),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Regis()));
                  },
                  child: const Text("Belum Punya Akun? Klik Disini Untuk Register"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
