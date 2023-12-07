import 'package:flutter/material.dart';
import 'package:main/models/selectSeatsModel.dart';
import 'package:main/screens/selectJadwal.dart';
import 'package:main/screens/ticket_details.dart';
import 'package:provider/provider.dart';

import '../models/jadwal_data.dart';

class SelectSeat extends StatefulWidget {
  const SelectSeat({Key? key}) : super(key: key);

  @override
  _SelectSeatState createState() => _SelectSeatState();
}

class _SelectSeatState extends State<SelectSeat> {
  bool isContainerVisible = false;
  List<String> selectedSeats = [];

  @override
  Widget build(BuildContext context) {
    final selectedSeatsModel =
        Provider.of<SelectedSeatsModel>(context, listen: false);
    final jadwalProvider = Provider.of<JadwalProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 29, 26),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            InkWell(
              onTap: () {
                // Menangani klik pada ikon "arrow_back"
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    // Gantilah MyDestinationScreen dengan halaman tujuan yang sesuai
                    return const selectCategory();
                  }),
                );
              },
              child: Container(
                padding: const EdgeInsets.fromLTRB(15, 50, 5, 0),
                child: const Icon(
                  Icons.arrow_back,
                  size: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(17, 50, 0, 0),
              child: const Text(
                "Select Seat",
                style: TextStyle(
                  fontSize: 20,
                  color: Color.fromARGB(255, 255, 255, 255),
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
        Row(
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(35, 30, 30, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'F${index + 1}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'E${index + 1}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'D${index + 1}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'C${index + 1}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'B${index + 1}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'A${index + 1}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  const SizedBox(height: 20),
                  // Text(
                  //   selectedSeats.isEmpty
                  //       ? 'Belum ada kursi yang dipilih'
                  //       : 'Kursi yang dipilih: ${selectedSeats.join(', ')}',
                  //   style: const TextStyle(fontSize: 18),
                  // ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'F${index + 5}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'E${index + 5}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'D${index + 5}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'C${index + 5}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'B${index + 5}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  Consumer<SelectedSeatsModel>(
                      builder: (context, selectedSeatsModel, _) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(4, (index) {
                        final seat = 'A${index + 5}';
                        final isSeatSelected =
                            selectedSeatsModel.selectedSeats.contains(seat);

                        return GestureDetector(
                          onTap: () {
                            if (isSeatSelected) {
                              selectedSeatsModel.removeSelectedSeat(seat);
                            } else {
                              selectedSeatsModel.addSelectedSeat(seat);
                            }
                          },
                          child: buildSeat(seat, isSeatSelected),
                        );
                      }),
                    );
                  }),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Membuat Container menjadi lingkaran
                  color: Color.fromARGB(163, 191, 194, 194),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255)),
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
                decoration: BoxDecoration(
                  shape: BoxShape.circle, // Membuat Container menjadi lingkaran
                  //color: Color(0xFF8AB0AB),
                  border: Border.all(
                      color: const Color.fromARGB(255, 255, 255, 255)),
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
                                'assets/posterFilm1.jpg',
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
                            'Rp 40.000',
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
                          child: Text(
                            '${jadwalProvider.selectedTime!.hari}, ${jadwalProvider.selectedTime!.tanggal} ',
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
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
                            '18:00',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
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
                          child: Text(
                            "${selectedSeatsModel.selectedSeats.join(', ')} SEAT",
                            style: const TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
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
                            '1 ROW',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
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

  Widget buildSeat(String seatNumber, bool isSeatSelected) {
    final selectedSeatsModel =
        Provider.of<SelectedSeatsModel>(context, listen: false);
    return InkWell(
      onTap: () {
        if (isSeatSelected) {
          selectedSeatsModel.removeSelectedSeat(seatNumber);
        } else {
          selectedSeatsModel.addSelectedSeat(seatNumber);
        }
      },
      child: Container(
        width: 20,
        height: 20,
        margin: const EdgeInsets.all(5.0),
        decoration: BoxDecoration(
          color: isSeatSelected
              ? const Color(0xFF8AB0AB)
              : const Color.fromARGB(255, 26, 29, 26),
          border: Border.all(color: const Color.fromARGB(255, 255, 255, 255)),
        ),
        child: Center(
          child: Text(
            seatNumber,
            style: const TextStyle(
              color: const Color.fromARGB(255, 26, 29, 26),
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ),
      ),
    );
  }
}
