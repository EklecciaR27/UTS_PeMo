import 'package:flutter/material.dart';
import 'package:main/screens/home_movie_page.dart';
import 'package:main/screens/mytickets.dart';
import 'package:main/screens/profile_page.dart';
import 'package:main/screens/topup.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  _BottomNavState createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentIndex = 0;
  List<Widget> menuBottomNav = [
    HomeMoviePage(),
    MyTickets(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: const Color(0xFF1A1D1A),
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie_creation_outlined,
                color: Color(0xFF25403B), size: 30),
            activeIcon: Icon(Icons.movie, color: Color(0xFF8AB0AB), size: 30),
            label: "Movie",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.wallet, color: Color(0xFF25403B), size: 30),
            activeIcon: Icon(Icons.wallet, color: Color(0xFF8AB0AB), size: 30),
            label: "My Tickets",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Color(0xFF25403B), size: 30),
            activeIcon: Icon(Icons.person, color: Color(0xFF8AB0AB), size: 30),
            label: "Profil",
          ),
        ],
        unselectedItemColor: const Color(0xFF25403B),
        selectedItemColor: const Color(0xFF8AB0AB),
      ),
      body: menuBottomNav[currentIndex],
    );
  }
}
