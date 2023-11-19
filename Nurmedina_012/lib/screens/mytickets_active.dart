import 'package:flutix/ticketsdetail.dart';
import 'package:flutter/material.dart';
import 'package:flutix/mytickets.dart';

class MyTicketsActive extends StatelessWidget {
  const MyTicketsActive({Key? key});

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: lebar,
            height: tinggi * 1.5, // Menambahkan ketinggian agar bisa discroll
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Colors.black),
            child: Stack(
              children: [
                // mytickets1
                MyTicketItem(
                  imagePath: 'assets/posterFilm1.jpg',
                  title: 'NOAH',
                  cinema: 'XXI BIGMALL',
                  
                  date: '30.11.2023',
                  time: '12.00',
                  topPosition: 15,
                ),
                MyTicketItem(
                  imagePath: 'assets/posterFilm2.jpg',
                  title: 'TABU',
                  cinema: 'XXI BIGMALL',
                  
                  date: '30.11.2023',
                  time: '12.00',
                  topPosition: 300,
                ),
                MyTicketItem(
                  imagePath: 'assets/posterFilm3.jpg',
                  title: 'Titanic',
                  cinema: 'XXI BIGMALL',
                  
                  date: '30.11.2023',
                  time: '12.00',
                  topPosition: 575,
                ),
              ],
            ),
          ),
        ],
      ),
      physics:
          AlwaysScrollableScrollPhysics(), // Mengatur agar selalu bisa discroll
    );
  }
}

class MyTicketItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final String cinema;

  final String date;
  final String time;
  final double topPosition;

  const MyTicketItem({
    required this.imagePath,
    required this.title,
    required this.cinema,

    required this.date,
    required this.time,
    required this.topPosition,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: topPosition,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TicketsDetail(
                      title: title, // Gunakan informasi dari tiket yang diklik
                      cinema: cinema,
                      date: date,
                      time: time,
                      imagePath: imagePath,
                    )),
          );
        },
        child: Container(
          width: 600,
          height: 250,
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [Color(0xFF26413C), Color(0x0026413C)],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 30, top: 15),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 700,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFFC0CBAD),
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Cinema',
                      style: TextStyle(
                        color: Color(0xFF8AB0AB),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      cinema,
                      style: TextStyle(
                        color: Color(0xFF8AB0AB),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Date',
                      style: TextStyle(
                        color: Color(0xFF8AB0AB),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      date,
                      style: TextStyle(
                        color: Color(0xFF8AB0AB),
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Time',
                      style: TextStyle(
                        color: Color(0xFF8AB0AB),
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Color(0xFF8AB0AB),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
