import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:main/auth.dart';
import 'package:main/firebase_options.dart';
import 'package:main/models/jadwal_data.dart';
import 'package:main/models/selectSeatsModel.dart';
import 'package:main/models/topup_amount_data.dart';
import 'package:main/models/user_data.dart';
import 'package:main/screens/selectJadwal.dart';
import 'package:main/screens/signIn.dart';
import 'package:main/screens/signUp.dart';
import 'package:main/screens/splashPage.dart';
import 'package:main/screens/ticket_details.dart';
import 'dart:ui';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //inisialisasi firebase utk apk
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) =>
                Auth()), //provider untuk auth /nyimpan data di auth dan firestore
        ChangeNotifierProvider(
            create: (_) =>
                UserData()), //provider utk nyimpan data user secara lokal di UserData
        ChangeNotifierProvider(create: (_) => TopupData()),
        ChangeNotifierProvider(
          create: (context) => SelectedSeatsModel(),
        ),
        ChangeNotifierProvider(
          create: (context) => JadwalProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const selectCategory()
        // StreamBuilder<User?>(
        //   stream: FirebaseAuth.instance.authStateChanges(),
        //   builder: (context, snapshot) {
        //     if (snapshot.hasData) {
        //       return Login(); // Replace with the appropriate widget for authenticated users
        //     } else {
        //       return Regis(); // Replace with the appropriate widget for non-authenticated users
        //     }
        //   },
        // ),
        );
  }
}
