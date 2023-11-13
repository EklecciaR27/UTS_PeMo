import 'package:flutter/material.dart';
import 'edit_profile_page.dart';
import 'my_wallet_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;

  void _onItemTap(int index) {
    setState(() {
      _index = index;
    });
  }

  void _navigateToProfilePage(BuildContext context, String title) {
    switch (title) {
      case "Edit Profile":
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => EditProfilePage(),
          ),
        )
            .then((result) {
          setState(() {
            for (var i = 0; i < isSelectedList.length; i++) {
              isSelectedList[i] = false;
            }
            for (var i = 0; i < photos.length; i++) {
              photos[i]["image"] =
                  isSelectedList[i] ? selectedImageNames[i] : imageNames[i];
            }
          });
        });
        break;
      case "My Wallet":
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => MyWalletPage(),
          ),
        )
            .then((result) {
          setState(() {
            for (var i = 0; i < isSelectedList.length; i++) {
              isSelectedList[i] = false;
            }
            for (var i = 0; i < photos.length; i++) {
              photos[i]["image"] =
                  isSelectedList[i] ? selectedImageNames[i] : imageNames[i];
            }
          });
        });
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

  final List<String> imageNames = [
    "assets/user-avatar.png",
    "assets/wallet1.png",
    "assets/language.png",
    "assets/question.png",
    "assets/review.png",
  ];

  final List<String> selectedImageNames = [
    "assets/user-avatar2.png",
    "assets/wallet2.png",
    "assets/language2.png",
    "assets/question2.png",
    "assets/review2.png",
  ];

  @override
  void initState() {
    super.initState();
    isSelectedList = List.generate(photos.length, (index) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        unselectedItemColor: Color.fromRGBO(62, 80, 91, 1),
        selectedItemColor: Color.fromRGBO(138, 176, 171, 1),
        currentIndex: _index,
        onTap: _onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Movie",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble),
            label: "My Tickets",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt_outlined),
            label: "Profile",
          ),
        ],
      ),
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
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/user-avatar.png",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Refal Hady",
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
                    "refalhady@gmail.com",
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
