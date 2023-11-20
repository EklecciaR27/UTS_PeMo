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

import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => Auth()), // Provider for authentication
        ChangeNotifierProvider(
            create: (_) => UserData()), // Provider for user data
        ChangeNotifierProvider(
            create: (_) => TopupData()), // Provider for user data
        ChangeNotifierProvider(
          create: (context) => SelectedSeatsModel(), // provider for seat data
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
        home: 
            StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Login(); // Replace with the appropriate widget for authenticated users
            } else {
              return Regis(); // Replace with the appropriate widget for non-authenticated users
            }
          },
        ),
        );
  }
}
