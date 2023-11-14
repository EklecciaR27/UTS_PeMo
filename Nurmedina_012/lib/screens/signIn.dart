import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/auth.dart';
import 'package:main/screens/confirmation_page.dart';
import 'package:main/screens/signUp.dart';

// import 'signUp.dart';

// class SignInPage extends StatelessWidget {
//   const SignInPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Input Page',
//       theme: ThemeData(
//         primarySwatch: Colors.green, // You missed a comma here
//         scaffoldBackgroundColor: Colors.black,
//       ),
//       home: SignInForm(title: 'Input Review'), // No need for 'const' here
//     );
//   }
// }

// class SignInForm extends StatefulWidget {
//   const SignInForm({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _SignInFormState createState() => _SignInFormState();
// }

// class _SignInFormState extends State<SignInForm> {
//   final TextEditingController _controllerEmail = TextEditingController();
//   final TextEditingController _controllerPW = TextEditingController();
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   // FirebaseFirestore firestore = FirebaseFirestore.instance;
//   // CollectionReference dataUser =
//   // FirebaseFirestore.instance.collection("data_user");
// void signInUser() async {
//   String email = _controllerEmail.text;
//   String password = _controllerPW.text;

//   try {
//     // Lakukan pemeriksaan data pengguna di Firebase Database
//     bool userExists = await verifyUserData(email, password);

//     if (userExists) {
//       // Data pengguna valid, lanjutkan ke halaman selanjutnya
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => ConfirmationPage()),
//       );
//     } else {
//       // Data pengguna tidak valid, tampilkan pesan kesalahan
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Invalid email or password."),
//         ),
//       );
//     }
//   } catch (e) {
//     // Tangani kesalahan jika terjadi
//     print("Error: $e");
//   }
// }
// Future<bool> verifyUserData(String email, String password) async {
//   try {
//     // Lakukan kueri ke Firestore untuk mendapatkan dokumen dengan email yang sesuai
//     DocumentSnapshot snapshot = await FirebaseFirestore.instance
//         .collection('users')
//         .doc(email)
//         .get();

//     // Periksa apakah dokumen dengan email tersebut ada
//     if (snapshot.exists) {
//       // Ambil nilai password dari dokumen
//       String? storedPassword = snapshot['password'] as String?;

//       // Periksa apakah kata sandi sesuai
//       return storedPassword != null && storedPassword == password;
//     } else {
//       // Dokumen dengan email tersebut tidak ditemukan
//       return false;
//     }
//   } catch (e) {
//     // Tangani kesalahan jika terjadi
//     print("Error: $e");
//     return false;
//   }
// }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: Text("Add Review"),
//       // ),
//       body: Stack(
//         children: <Widget>[
//           SizedBox(
//             height: 10,
//           ),
//           Container(
//               width: 700,
//               height: 900,
//               padding: EdgeInsets.only(left: 30, top: 20),
//               margin: EdgeInsets.only(bottom: 10),
//               child: Text(
//                 "Welcome Back, \nto Flutix",
//                 style: TextStyle(
//                     color: Color(0xFFC0CBAD),
//                     fontSize: 26,
//                     fontWeight: FontWeight.bold),
//               )),
//           Positioned(
//             top: 300, // Mengatur posisi ke atas
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
//                   Positioned(
//                       child: Container(
//                     margin: EdgeInsets.only(right: 230, top: 30),
//                     child: Text(
//                       "Sign In",
//                       style: TextStyle(
//                           color: Color(0xFFC0CBAD),
//                           fontSize: 25,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   )),
//                   SizedBox(
//                     height: 40,
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
//                   SizedBox(height: 40),
//                   Container(
//                     width: 250, // Atur lebar sesuai kebutuhan Anda
//                     height: 40,
//                     child: ElevatedButton(
//                       onPressed: signInUser,
//                       style: ButtonStyle(
//                         shape:
//                             MaterialStateProperty.all<RoundedRectangleBorder>(
//                           RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(6.0),
//                               side: BorderSide(
//                                 color: Color(0xFF8AB0AB),
//                                 width: 2.0,
//                               )
//                               // Radius sudut disesuaikan sesuai kebutuhan Anda
//                               ),
//                         ),
//                         foregroundColor: MaterialStateProperty.all<Color>(
//                             Colors.white), // Warna teks
//                         backgroundColor:
//                             MaterialStateProperty.all<Color>(Color(0xFF8AB0AB)),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           SizedBox(width: 8, height: 8),
//                           Text(
//                             "Sign In",
//                             style: TextStyle(
//                                 fontSize: 16, fontWeight: FontWeight.w400),
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
//                           "Don't Have an Account?",
//                           style: TextStyle(
//                               color: Color(0xFF8AB0AB),
//                               fontSize: 17,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         TextButton(
//                             onPressed: () {
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (context) =>
//                                       SignUpPage(title: 'Your Title Here'),
//                                 ),
//                               );
//                             },
//                             child: Text(
//                               "Sign Up",
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
// //     home: SignInPage(),
// //   ));
// // }

// import 'Regis.dart';
// import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

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
    // Panggil metode login yang telah diperbarui
    String? fullName = await Auth().login(email, password);

    // Tampilkan full name di sini, misalnya dengan menggunakan SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Logged in as: $fullName'),
      ),
    );

    // Navigasi ke halaman selanjutnya setelah login berhasil
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ConfirmationPage()),
    );
  } catch (e) {
    print("Error: $e");

    // Tangani kesalahan berdasarkan kode kesalahan dari Firebase
    String errorMessage = "Failed to login. Please check your credentials.";

    if (e is FirebaseAuthException) {
      if (e.code == 'user-not-found') {
        errorMessage = 'No user found for that email.';
      } else if (e.code == 'wrong-password') {
        errorMessage = 'Wrong password provided for that user.';
      }
      // Anda dapat menangani kode kesalahan lain sesuai kebutuhan
    }

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
                Text(
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
                      return 'Silakan Masukkan Password Anda';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Password',
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Regis()));
                  },
                  child: Text("Belum Punya Akun? Klik Disini Untuk Register"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
