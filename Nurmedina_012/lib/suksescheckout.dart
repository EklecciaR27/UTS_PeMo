import 'package:flutter/material.dart';

class SuksesTopup extends StatefulWidget {
  const SuksesTopup({super.key});

  @override
  State<SuksesTopup> createState() => _SuksesTopupState();
}

class _SuksesTopupState extends State<SuksesTopup> {
  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    var tinggi = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor:
          const Color.fromARGB(255, 137, 176, 171), //warna latar belakang
      body: SafeArea(
        child: Column(children: [
          const Spacer(),
          Text(
            "Happy Watching!",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Image.asset(
            "assets/happywatch.png",
            height: 400,
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "You Have Successfully Bought The Tickets",
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          SizedBox(
            height: 40,
            width: 140,
            child: ElevatedButton(
              onPressed: () {
                //Navigator.pushNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color.fromRGBO(44, 44, 44, 1),
              ),
              child: Text(
                'Back to Home',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
