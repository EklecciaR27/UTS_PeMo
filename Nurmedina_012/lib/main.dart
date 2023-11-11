import 'package:flutter/material.dart';
import 'package:main/signUp.dart';
import 'package:main/signIn.dart';
import 'package:main/splashPage.dart';
import 'package:main/suksestopup.dart';

void main() {
  //fungsi utama
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false, //non aktifkan banner debug
      theme: ThemeData(
        primarySwatch: Colors.blue, //warna tema utama
      ),
      routes: {
        '/': (context) => const SplashPage(), //akan menampilkan halaman splash
        'SignIn': (context) => const SignInPage(),
        'SignUp': (context) => const SignUpPage(),
        'suksestopup': (context) => const SuksesTopup(),
      },
      initialRoute: '/', //halaman pertama yang akan ditampilkan deluan
      //home: SuksesTopup(),
    );
  }
}
