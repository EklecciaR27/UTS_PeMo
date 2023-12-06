import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:main/models/jadwal_data.dart';
import 'package:main/models/selectSeatsModel.dart';
import 'package:main/models/topup_service.dart';
import 'package:main/screens/select_seat.dart';
import 'package:main/screens/topup.dart';
import 'package:provider/provider.dart';
import '../models/topup_amount_data.dart';

class detailsTiket extends StatefulWidget {
  const detailsTiket({super.key});

  @override
  State<detailsTiket> createState() => _detailsTiketState();
}

class _detailsTiketState extends State<detailsTiket> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  // final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  late TopupService _topupService;

  double? nominal = 0.0;
  @override
  void initState() {
    super.initState();
    _topupService = TopupService();
    fetchNominalTopUp();
  }

  void fetchNominalTopUp() async {
    try {
      var user = _auth.currentUser;
      var email = user?.email ?? '';

      var topUp = await _topupService.getNominalTopUp(email);

      if (topUp != null) {
        Provider.of<TopupData>(context, listen: false).updateTopUp(topUp);

        setState(() {
          nominal = topUp.nominal;
        });
      }
    } catch (e) {
      print('Error fetching top-up amount: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    final selectedSeatsModel = Provider.of<SelectedSeatsModel>(context);
    final jadwalProvider = Provider.of<JadwalProvider>(context);

    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 26, 29, 26),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return const SelectSeat();
                    }),
                  );
                },
                child: Container(
                  //margin: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                  padding: const EdgeInsets.fromLTRB(15, 15, 5, 20),
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                    color: Color.fromARGB(
                        255, 192, 203, 173), // You can set the color as needed
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(15, 15, 0, 20),
                child: const Text(
                  "Check details below \n before Checkout",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 192, 203, 173),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Container(
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(20, 20, 5, 0),
                  child: Image.asset(
                    'assets/posterFilm1.jpg',
                    width: 149,
                    height: 206,

                    //color: const Color.fromARGB(255, 192, 203, 173),
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                  padding: const EdgeInsets.fromLTRB(20, 15, 0, 140),
                  child: const Column(
                    children: [
                      Text(
                        "NOAH",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 137, 176, 171),
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.star,
                              size: 25,
                              color: Color.fromARGB(255, 255, 191, 0)),
                          Icon(Icons.star,
                              size: 25,
                              color: Color.fromARGB(255, 255, 191, 0)),
                          Icon(Icons.star,
                              size: 25,
                              color: Color.fromARGB(255, 255, 191, 0)),
                          Icon(Icons.star,
                              size: 25,
                              color: Color.fromARGB(255, 255, 191, 0)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: Container(
              height: 250,
              width: 320,
              margin: const EdgeInsets.fromLTRB(0, 30, 0, 0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 26, 29, 26),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: const Text(
                        "ID Order",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(90, 10, 0, 0),
                      child: const Text(
                        "2120828390",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: const Text(
                        "Cinema",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(140, 10, 0, 0),
                      child: const Text(
                        "Big Mall",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: const Text(
                        "Date & Time",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(110, 10, 0, 0),
                      child: Text(
                        '${jadwalProvider.selectedTime!.hari}, ${jadwalProvider.selectedTime!.tanggal}',
                        style: const TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: const Text(
                        "Tickets",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(190, 10, 0, 0),
                      child: Text(
                        "${selectedSeatsModel.selectedSeats.join(',')}",
                        style: const TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: const Text(
                        "Fees",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(150, 10, 0, 0),
                      child: const Text(
                        "Rp 100.000",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                      child: const Text(
                        "Total",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(150, 10, 0, 0),
                      child: const Text(
                        "Rp 100.000",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    )
                  ],
                )
              ]),
            ),
          ),
          Center(
              child: Container(
            margin: const EdgeInsets.fromLTRB(0, 20, 10, 0),
            width: 300,
            height: 25,
            decoration: const BoxDecoration(
                color: Color.fromARGB(255, 137, 176, 171),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50))),
            child: Column(children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                    child: const Text(
                      "Saldo Wallet",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                    child: Text(
                      "Rp. $nominal",
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 255, 255, 255)),
                    ),
                  )
                ],
              ),
            ]),
          )),
          Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.fromLTRB(120, 0, 0, 0),
                      child: const Text(
                        "Top Up Saldo",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(15, 15, 5, 20),
                      child: GestureDetector(
                        onTap: () {
                          // Navigate to the other page when the icon is clicked
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TopupPage()),
                          );
                        },
                        child: const Icon(
                          Icons.wallet_sharp,
                          size: 30,
                          color: Color.fromARGB(255, 192, 203, 173),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )
        ]));
  }
}
