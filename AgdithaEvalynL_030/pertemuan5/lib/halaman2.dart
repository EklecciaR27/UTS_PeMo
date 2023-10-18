import 'package:flutter/material.dart';

class Halaman2 extends StatelessWidget {
  const Halaman2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HALAMAN 2'),
      ),
      body: Center(
        child: OutlinedButton(
          child: const Text('PINDAH SCREEN'),
          onPressed: () {
            //Navigator.pop(context);
            Navigator.pushNamed(context, '/halaman3');
          },
        ),
      ),
    );
  }
}
