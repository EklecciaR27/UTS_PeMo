import 'package:flutter/material.dart';
import 'package:main/screens/ticket_details.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({Key? key}) : super(key: key);

  @override
  _SelectSeatState createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  bool isContainerVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 29, 26),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                // Menangani klik pada ikon "arrow_back"
                Navigator.pop(context);
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 10, 5, 0),
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Color.fromARGB(255, 192, 203, 173),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(17, 10, 0, 0),
              child: const Text(
                "Select Seat",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 192, 203, 173),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Divider(
          thickness: 1,
          color: Color.fromARGB(255, 255, 255, 255),
          indent: 80, // Jarak piksel di awal garis (start)
          endIndent: 80, // Atur warna sesuai kebutuhan
        ),
        Container(
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(45, 19, 10, 10),
                width: 8, // Sesuaikan ukuran Container
                height: 8, // Sesuaikan ukuran Container
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Membuat Container menjadi lingkaran
                  color: Color(0xFF8AB0AB),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
                child: const Text(
                  "Selected",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 192, 203, 173),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(30, 10, 5, 0),
                width: 8, // Sesuaikan ukuran Container
                height: 8, // Sesuaikan ukuran Container
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Membuat Container menjadi lingkaran
                  color: Color(0xFF8AB0AB),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
                child: const Text(
                  "Reserved",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 192, 203, 173),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(35, 10, 10, 0),
                width: 8, // Sesuaikan ukuran Container
                height: 8, // Sesuaikan ukuran Container
                decoration: const BoxDecoration(
                  shape: BoxShape.circle, // Membuat Container menjadi lingkaran
                  color: Color(0xFF8AB0AB),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(3, 10, 0, 0),
                child: const Text(
                  "Available",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 192, 203, 173),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              isContainerVisible = !isContainerVisible;
            });
          },
          style: ElevatedButton.styleFrom(
            primary: const Color.fromARGB(255, 26, 29, 26), // background color
            //onPrimary: Colors.white, // text color
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            'Done',
            style: TextStyle(
                fontSize: 20, color: Color.fromARGB(255, 192, 203, 173)),
          ),
        ),
        Center(
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeOutExpo,
            width: 400,
            height: isContainerVisible ? 300 : 0,
            child: Visibility(
              visible: isContainerVisible,
              child: Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 40, 81, 73),
                      Color.fromARGB(255, 0, 0, 0)
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  color: Colors.blue,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 10, 10, 10),
                          child: const Text(
                            'My Ticket!',
                            style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 192, 203, 173),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Visibility(
                          visible: isContainerVisible,
                          child: AnimatedOpacity(
                            duration: const Duration(seconds: 1),
                            opacity: isContainerVisible ? 1.0 : 0.0,
                            child: Container(
                              padding: const EdgeInsets.fromLTRB(30, 10, 5, 0),
                              child: Image.asset(
                                'assets/myName.jpg',
                                width: 102,
                                height: 141,
                                //color: const Color.fromARGB(255, 192, 203, 173),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(30, 10, 10, 0),
                          child: const Text(
                            'Price',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 192, 203, 173),
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(50, 0, 10, 0),
                          child: const Text(
                            'Rp 300.000',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 192, 203, 173),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.fromLTRB(0, 50, 5, 0),
                              child: const Icon(
                                Icons.location_pin,
                                size: 20,
                                color: Color.fromARGB(255, 192, 203, 173),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(05, 50, 0, 0),
                              child: const Text(
                                "XXI BIGMALL",
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Color.fromARGB(255, 192, 203, 173),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF8AB0AB),
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 3, 20, 3),
                          child: const Text(
                            'xxx',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF8AB0AB),
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 3, 20, 3),
                          child: const Text(
                            'xxx',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF8AB0AB),
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 3, 20, 3),
                          child: const Text(
                            'xxx',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: const Color(0xFF8AB0AB),
                          ),
                          padding: const EdgeInsets.fromLTRB(20, 3, 20, 3),
                          child: const Text(
                            'xxx',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            // Navigasi ke halaman baru di sini
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const detailsTiket()),
                            );
                          },
                          child: Container(
                            margin: const EdgeInsets.fromLTRB(40, 25, 0, 0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFF8AB0AB),
                            ),
                            padding: const EdgeInsets.fromLTRB(60, 5, 60, 5),
                            child: const Text(
                              'Buy',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
