import 'package:flutter/material.dart';
import 'package:pertemuan5/halaman2.dart';
import 'package:pertemuan5/halaman3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo HAIIIIIIIIIIIIII',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Halaman1(),
      routes: {
        '/halaman1': (context) => const Halaman1(),
        '/halaman2': (context) => const Halaman2(),
        '/halaman3': (context) => const Halaman3(),
      },
    );
  }
}

class Halaman1 extends StatefulWidget {
  const Halaman1({super.key});

  @override
  State<Halaman1> createState() => _Halaman1State();
}

class _Halaman1State extends State<Halaman1> {
  int _index = 0;
  void _onItemTap(int index) {
    setState(() {
      _index = index;
    });
  }

  static List<Widget> _pages = [
    const Icon(
      Icons.home,
      size: 100,
    ),
    const Icon(
      Icons.chat_bubble,
      size: 100,
    ),
    const Icon(
      Icons.call,
      size: 100,
    ),
    const Icon(
      Icons.camera,
      size: 100,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const Drawer(
          backgroundColor: Colors.white,
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(
                        //'https://avatars.githubsercontent.com/AgdithaEL'
                        'https://www.save-free.com/cdn/https://instagram.fsaw2-3.fna.fbcdn.net/v/t51.2885-19/357368561_816841732955574_5623193634847028596_n.jpg?_nc_ht=instagram.fsaw2-3.fna.fbcdn.net&_nc_cat=106&_nc_ohc=SwQWFqdrZ8EAX8avVpK&edm=AEF8tYYBAAAA&ccb=7-5&oh=00_AfB9GjYY82TQeUt9xBiPH_6QyeAH8d-9QU_HfAIUvnag_g&oe=652C1A38&_nc_sid=1e20d2'),
                  ),
                  accountName: Text(
                    "DITZ LAWSONNN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  accountEmail: Text("@sbanz")),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                //onTap: () {},
              ),
              ListTile(
                leading: Icon(Icons.search),
                title: Text('Cari'),
                //onTap: () {},
              ),
            ],
          ),
        ),
        appBar: AppBar(
          title: const Text('HALAMAN 1'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/halaman3');
                },
                icon: const Icon(Icons.search))
          ],
          // leading: IconButton(
          //   icon: const Icon(
          //     Icons.menu,
          //     size: 30,
          //   ),
          //   onPressed: () {},
        ),
        body: Center(
          child: _pages.elementAt(_index),
        ),
        // body: Center(
        //     child: ElevatedButton(
        //   child: const Text('Pindah Screen'),
        //   onPressed: () {
        //     // Navigator.push(
        //     //   context,
        //     //   MaterialPageRoute(
        //     //     builder: (context) {
        //     //       return const Halaman2();
        //     //     },
        //     //   ),
        //     // );
        //     Navigator.pushNamed(context, '/halaman2');
        //     // Navigator.pushNamed(context, '/halaman3');
        //   },
        // )),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.blueAccent,
          unselectedItemColor: Colors.white,
          selectedItemColor: Colors.black,
          currentIndex: _index,
          onTap: _onItemTap,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_bubble),
              label: "Chat",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.call),
              label: "Telpon",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.camera_alt_outlined),
              label: "Camera",
            ),
          ],
        ));
  }
}
