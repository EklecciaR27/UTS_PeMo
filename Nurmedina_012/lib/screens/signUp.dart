// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/auth.dart';
import 'package:main/models/user.dart';
import 'package:main/models/user_data.dart';
import 'package:provider/provider.dart';
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
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextFormField(
                  controller: _ctrlFullName,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Full Name',
                  ),
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: _ctrlEmail,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Email',
                  ),
                ),
                SizedBox(height: 10),
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
                    border: OutlineInputBorder(),
                    hintText: 'Password',
                  ),
                ),
                SizedBox(height: 10),
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
                    border: OutlineInputBorder(),
                    hintText: 'Confirm Password',
                  ),
                ),
                SizedBox(height: 10),
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
                      : Text("Submit"),
                ),
                SizedBox(
                  height: 10,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: Text("Already have an account? Click here to login"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
