import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:main/auth.dart';
import 'package:main/models/user.dart';
import 'package:main/models/user_data.dart';
import 'signIn.dart';

// class SignUpPage extends StatefulWidget {
//   const SignUpPage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _SignUpPageState createState() => _SignUpPageState();
// }

// class _SignUpPageState extends State<SignUpPage> {
//   final TextEditingController _controllerFullName = TextEditingController();
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPW = TextEditingController();
//   final TextEditingController _controllerKonfirm = TextEditingController();

//   FirebaseFirestore firestore = FirebaseFirestore.instance;
//   CollectionReference dataUser =
//   FirebaseFirestore.instance.collection("data_user");
//   userData userDataInstance = userData();

//   void addUser() {
//   String fullName = _controllerFullName.text;
//   String email = _controllerEmail.text;
//   String password = _controllerPW.text;
//   String confirmPassword = _controllerKonfirm.text;

//    if (fullName.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please fill all the fields')),
//       );
//       return;
//     }

//     // Validasi format email
//     final emailRegExp = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
//     if (!emailRegExp.hasMatch(email)) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Invalid email format')),
//       );
//       return;
//     }

//     // Jika password tidak sama dengan konfirmasi password
//     if (password != confirmPassword) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Passwords do not match')),
//       );
//       return;
//     }


//   // Buat instance User baru
//   User newUser = User(
//     fullName: fullName,
//     email: email,
//     password: password,
//     confirmPassword: confirmPassword,
//     // Tambahkan gambar jika dibutuhkan
//     foto: Image.asset('path_to_image'), // Ganti 'path_to_image' dengan path gambar yang sesuai
//   );

//   // Menambahkan user ke dalam userData
//   userDataInstance.addUser(newUser);// Pastikan userData telah diinisialisasi sebelumnya

//   // Menyimpan data ke Firestore
//   Map<String, dynamic> userData = {
//     'fullName': newUser.fullName,
//     'email': newUser.email,
//     'password': newUser.password,
//     'confirmPassword': newUser.confirmPassword,
//     // Jika menyimpan gambar, gunakan tipe data yang sesuai seperti URL atau path
//     'foto': 'path_to_image',
//   };

//   dataUser.add(userData).then((value) {
//     print("User Added");
//     Navigator.push(context, MaterialPageRoute(builder: (context) => SignInPage()));
//   }).catchError((error) => print("Failed to add user: $error"));
// }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("Add Review"),
//       // ),
//       body: Stack(
//         children: <Widget>[
//           Container(
//             width: 700,
//             height: 900,
//             padding: EdgeInsets.only(left: 10, bottom: 500),
//             margin: EdgeInsets.only(bottom: 10),
//             child: Image.asset(
//               'assets/flutix.png',
//               width: 200,
//               height: 200,
//             ),
//           ),
//           Positioned(
//             top: 160, // Mengatur posisi ke atas
//             right: 0,
//             left: 1,
//             child: Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(30),
//                 color: Color(0xFF26413C),
//               ),
//               width: 500,
//               height: 900,
//               child: Column(
//                 children: [
//                   SizedBox(
//                     height: 60,
//                   ),
//                   Container(
//                     width: 310,
//                     child: TextField(
//                       controller: _controllerFullName,
//                       decoration: InputDecoration(
//                         filled: false, // latar belakang
//                         fillColor: Colors.white, // warna latar belakang
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide(
//                             color: Color(0xFF8AB0AB),
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                         labelText: "Full Name",
//                         hintText: "Full Name",
//                         labelStyle: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                         hintStyle: TextStyle(color: Colors.white),
//                       ),
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: 310,
//                     child: TextField(
//                       controller: _controllerEmail,
//                       decoration: InputDecoration(
//                         filled: false, // latar belakang
//                         fillColor: Colors.white, // warna latar belakang
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide(
//                             color: Color(0xFF8AB0AB),
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                         labelText: "Email",
//                         hintText: "Email",
//                         labelStyle: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                         hintStyle: TextStyle(color: Colors.white),
//                       ),
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: 310,
//                     child: TextField(
//                       controller: _controllerPW,
//                       decoration: InputDecoration(
//                         filled: false, // latar belakang
//                         fillColor: Colors.white, // warna latar belakang
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide(
//                             color: Color(0xFF8AB0AB),
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                         labelText: "Password",
//                         hintText: "Password",
//                         labelStyle: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                         hintStyle: TextStyle(color: Colors.white),
//                       ),
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 30,
//                   ),
//                   Container(
//                     width: 310,
//                     child: TextField(
//                       controller: _controllerKonfirm,
//                       decoration: InputDecoration(
//                         filled: false, // latar belakang
//                         fillColor: Colors.white, // warna latar belakang
//                         enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(10.0),
//                           borderSide: BorderSide(
//                             color: Color(0xFF8AB0AB),
//                           ),
//                         ),
//                         focusedBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(15.0),
//                           borderSide: BorderSide(
//                             color: Colors.white,
//                           ),
//                         ),
//                         labelText: "Confirm Password",
//                         hintText: "Confirm Password",
//                         labelStyle: TextStyle(
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white),
//                         hintStyle: TextStyle(color: Colors.white),
//                       ),
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                   SizedBox(height: 40),
//                   Container(
//                     width: 250, // Atur lebar sesuai kebutuhan Anda
//                     height: 40,
//                     child: ElevatedButton(
//                       onPressed: addUser, // Panggil signUp() saat tombol ditekan
//                       style: ButtonStyle(
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(6.0),
//                             side: BorderSide(
//                               color: Color(0xFF8AB0AB),
//                               width: 2.0,
//                             ),
//                           ),
//                         ),
//                         foregroundColor:
//                             MaterialStateProperty.all<Color>(Colors.white),
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Color(0xFF8AB0AB)),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(width: 8, height: 8),
//                           Text(
//                             "Sign Up",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w400,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: 20,
//                   ),
//                   Container(
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           "already have an Account?",
//                           style: TextStyle(
//                               color: Color(0xFF8AB0AB),
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => SignInPage()));
//                             },
//                             child: Text(
//                               "Sign in",
//                               style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.bold),
//                             ))
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// // void main() {
// //   runApp(MaterialApp(
// //     home: SignUpPage(),
// //   ));
// // }

// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, must_be_immutable, prefer_final_fields

// import 'Login.dart';
// import 'package:flutter/material.dart';

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

  Auth _auth = Auth(); // Buat instance dari kelas Auth

handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final fullName = _ctrlFullName.value.text;
    final email = _ctrlEmail.value.text;
    final password = _ctrlPassword.value.text;
    final confirmPassword = _ctrlConfirmPassword.value.text;

    if (password != confirmPassword) {
      // Passwords do not match
      // Handle this case as needed, e.g., show an error message.
      return;
    }

    setState(() => _loading = true);

    try {
      // Call the regis method with only email and password
      await _auth.regis(fullName, email, password, confirmPassword);
      // Setelah registrasi berhasil, Anda dapat melakukan tindakan lain di sini
    } catch (e) {
      // Tangani kesalahan registrasi di sini
      print('Registration failed: $e');
      // Anda dapat menambahkan logika penanganan kesalahan atau menampilkan pesan kesalahan ke pengguna di sini
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
