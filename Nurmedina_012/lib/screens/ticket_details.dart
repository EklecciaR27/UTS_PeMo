import 'package:flutter/material.dart';
import 'package:main/models/selectSeatsModel.dart';
import 'package:main/screens/select_seat.dart';
import 'package:provider/provider.dart';

class detailsTiket extends StatefulWidget {
  const detailsTiket({super.key});

  @override
  State<detailsTiket> createState() => _detailsTiketState();
}

class _detailsTiketState extends State<detailsTiket> {
  //get selectedSeats => null;

  @override
  Widget build(BuildContext context) {
    final selectedSeatsModel = Provider.of<SelectedSeatsModel>(context);

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
                    'assets/myName.jpg',
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
                        "MY NAME",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 137, 176, 171),
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Bintang",
                        style: TextStyle(
                            fontSize: 11,
                            color: Color.fromARGB(255, 137, 176, 171),
                            fontWeight: FontWeight.bold),
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
                        "2109106030",
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
                      child: const Text(
                        "xxxxxx",
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
                        "2 Tickets",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color.fromARGB(255, 192, 203, 173)),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.fromLTRB(145, 10, 0, 0),
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
                      padding: const EdgeInsets.fromLTRB(183, 10, 0, 0),
                      child: const Text(
                        "xxxxxx",
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
                      padding: const EdgeInsets.fromLTRB(180, 10, 0, 0),
                      child: const Text(
                        "xxxxxx",
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
                    child: const Text(
                      "80.000",
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
                      child: const Icon(
                        Icons.wallet_sharp,
                        size: 30,
                        color: Color.fromARGB(255, 192, 203,
                            173), // You can set the color as needed
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]));
  }
}
