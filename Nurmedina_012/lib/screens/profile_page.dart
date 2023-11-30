// profile_page.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/models/user_data.dart';
import 'package:provider/provider.dart';
import 'edit_profile_page.dart';
import 'my_wallet_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:main/auth.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;
import 'package:firebase_storage/firebase_storage.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? fullName;
  String? email;
  String? photoUrl;

  @override
  void initState() {
    super.initState();
    fetchFullName();
    fetchEmail();
    fetchPhotoUrl();
    isSelectedList = List.generate(photos.length, (index) => false);
  }

  void fetchFullName() async {
    try {
      var userProvider = Provider.of<UserData>(context, listen: false);
      var user = userProvider.myUsers.first;

      if (user != null) {
        setState(() {
          fullName = user.fullName;
        });
      }
    } catch (e) {
      print('Error fetching full name: $e');
    }
  }

  void fetchEmail() async {
    try {
      var userProvider = Provider.of<UserData>(context, listen: false);
      var user = userProvider.myUsers.first;

      if (user != null) {
        setState(() {
          email = user.email;
        });
      }
    } catch (e) {
      print('Error fetching email: $e');
    }
  }

  void fetchPhotoUrl() async {
    try {
      final firebase_auth.User? user =
          FirebaseAuth.instance.currentUser;

      if (user != null) {
        String userEmail = user.email!;
        String fotoID = 'Foto_Profil_$userEmail';
        final Reference storageReference = FirebaseStorage.instance
            .ref()
            .child('profile_images/$fotoID.jpg');

        String downloadUrl = await storageReference.getDownloadURL();

        setState(() {
          photoUrl = downloadUrl;
        });
      }
    } catch (e) {
      print('Error getting image from Firebase Storage: $e');
    }
  }

  void _navigateToProfilePage(BuildContext context, String title) {
    switch (title) {
      case "Edit Profile":
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => EditProfilePage(title: title),
          ),
        )
            .then((result) {
          if (result == true) {
            fetchFullName();
          }
        });
        break;
      case "My Wallet":
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => MyWalletPage(),
          ),
        )
            .then((result) {});
        break;
    }
  }

  final List<Map<String, dynamic>> photos = [
    {
      "image": "assets/user-avatar.png",
      "title": "Edit Profile",
    },
    {
      "image": "assets/wallet1.png",
      "title": "My Wallet",
    },
    {
      "image": "assets/language.png",
      "title": "Change Language",
    },
    {
      "image": "assets/question.png",
      "title": "Help Center",
    },
    {
      "image": "assets/review.png",
      "title": "Rate Flutix",
    },
  ];

  late List<bool> isSelectedList;

  @override
  Widget build(BuildContext context) {
    Auth auth = Auth();

    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 106,
                height: 106,
                margin: const EdgeInsets.only(top: 120, bottom: 30),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(53),
                  child: photoUrl != null
                      ? Image.network(
                          photoUrl!,
                          fit: BoxFit.cover,
                        )
                      : Image.asset(
                          "assets/user-avatar.png",
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    fullName ?? "Nama Pengguna",
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    email ?? "Email Pengguna",
                    style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListView.builder(
                shrinkWrap: true,
                itemCount: photos.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        for (var i = 0; i < isSelectedList.length; i++) {
                          isSelectedList[i] = false;
                        }
                        isSelectedList[index] = true;
                      });
                      _navigateToProfilePage(context, photos[index]["title"]);
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 35,
                          height: 35,
                          margin: const EdgeInsets.only(left: 45),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              photos[index]["image"],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 27),
                          child: Text(
                            photos[index]["title"],
                            style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                color: isSelectedList[index]
                                    ? Color.fromRGBO(138, 176, 171, 1)
                                    : Color.fromRGBO(62, 80, 91, 1),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
