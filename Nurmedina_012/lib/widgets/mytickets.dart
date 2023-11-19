import 'package:flutter/material.dart';
import 'package:flutix/mytickets_active.dart';

class MyTickets extends StatelessWidget {
  const MyTickets({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: const Text(
            'My Tickets',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          bottom: const TabBar(
            labelColor: Color.fromARGB(193, 0, 255, 217),
            unselectedLabelColor: Color.fromARGB(193, 0, 131, 111),
            tabs: [
              Tab(text: "TICKETS"),
              Tab(text: "HISTORY"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            MyTicketsActive(),

            // Icon(Icons.flight, size: 350),
            // Icon(Icons.directions_transit, size: 350),
          ],
        ),
      ),
    );
  }
}
