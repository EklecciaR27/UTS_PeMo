import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main/firebase_options.dart';
import 'package:main/screens/signIn.dart';
import 'package:main/screens/signUp.dart';
import 'package:main/screens/splashPage.dart';
import 'package:main/screens/suksescheckout.dart';

import 'screens/confirmation_page.dart';

import 'screens/confirmation_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        '/': (context) => const ConfirmationPage(), //akan menampilkan halaman splash
        'SignIn': (context) => const SignInPage(),
        //'SignUp': (context) =>  SignUpPage(),
        'suksestopup': (context) => const SuksesTopup(),
        'confirmationpage': (context) => const ConfirmationPage(),
      },
      initialRoute: '/', //halaman pertama yang akan ditampilkan deluan
      //home: SuksesTopup(),
    );
  }
}
