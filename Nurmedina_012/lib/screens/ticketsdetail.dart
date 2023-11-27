import 'package:flutter/material.dart';

class TicketsDetail extends StatelessWidget {
  final String title;
  final String cinema;
  final String date;
  final String time;
  final String imagePath;

  TicketsDetail({
    required this.title,
    required this.cinema,
    required this.date,
    required this.time,
    required this.imagePath,
  });

  //const TicketsDetail({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 740,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.white),
          child: Stack(
            children: [
              Positioned(
                left: -100,
                top: 0,
                child: Container(
                  width: 600,
                  height: 1000,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              // Positioned(
              //   left: 50,
              //   top: 50,
              //   child: IconButton(
              //       icon: const Icon(
              //         Icons.arrow_back_outlined, // icon arrow back
              //         size: 20, // ukuran icon
              //         color: Colors.white, // warna icon
              //       ),
              //       onPressed: () {
              //         Navigator.pop(context);
              //       },
              //     ),
              // ),

              // Positioned(
              //   left: 20,
              //   top: 50,
              //   child: Text(
              //     'Tickets',
              //     style: TextStyle(
              //       color: Colors.white,
              //       fontSize: 30,
              //       decoration: TextDecoration.none,
              //     ),
              //   ),
              // ),

              Positioned(
                left: 128,
                top: 50,
                child: Text(
                  'Tickets',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),

              //posisi back
              // Positioned(
              //   left: 20,
              //   top: 44,
              //   child: Container(
              //     width: 34,
              //     height: 34,
              //     child: Stack(
              //       children: [
              //         Positioned(
              //           left: 0,
              //           top: 0,
              //           child: IconButton(
              //             icon: const Icon(
              //               Icons.arrow_back_outlined, // icon arrow back
              //               size: 35, // ukuran icon
              //               color: Colors.white, // warna icon
              //             ),
              //             onPressed: () {
              //               Navigator.pop(context);
              //             },
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),

              //ijo muda
              Positioned(
                left: 55,
                top: 130,
                child: Column(
                  children: [
                    Positioned(
                      child: Opacity(
                        opacity: 0.90,
                        //container tosca
                        child: Container(
                          width: 258,
                          height: 490,
                          decoration: ShapeDecoration(
                            color: Color(0xFF8AB0AB),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              //title
              Positioned(
                left: 65,
                top: 145,
                child: Container(
                  width: 230,
                  height: 45,
                  decoration: ShapeDecoration(
                    color: Color(0xFFD9D9D9),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 55, top: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Color(0xFF26413C),
                        fontSize: 30,
                        letterSpacing: 0.20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              ),

              // poster depan
              Positioned(
                left: 76,
                top: 200,
                child: Container(
                  width: 215,
                  height: 250,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.fill,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
              ),

              // studio dan jam
              Positioned(
                left: 85,
                top: 465,
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/location.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      cinema,
                      style: TextStyle(
                        color: Color(0xFF26413C),
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 85,
                top: 485,
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/clock.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      time,
                      style: TextStyle(
                        color: Color(0xFF26413C),
                        fontSize: 20,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ],
                ),
              ),

              Positioned(
                left: 80,
                top: 510,
                child: Text(
                  'STUDIO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Positioned(
                left: 170,
                top: 510,
                child: Text(
                  'ROW',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Positioned(
                left: 236,
                top: 510,
                child: Text(
                  'SEAT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),

              Positioned(
                left: 98,
                top: 528,
                child: Text(
                  '02',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Positioned(
                left: 170,
                top: 528,
                child: Text(
                  'AA',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
              Positioned(
                left: 239,
                top: 528,
                child: Text(
                  '01',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),

              Positioned(
                left: 156,
                top: 515,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(1.57),
                  child: Container(
                    width: 40,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF26413C),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 222,
                top: 515,
                child: Transform(
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0)
                    ..rotateZ(1.57),
                  child: Container(
                    width: 40,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Color(0xFF26413C),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 120,
                top: 565,
                child: Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/barcode.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
