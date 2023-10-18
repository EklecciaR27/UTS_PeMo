import 'package:flutter/material.dart';

class Halaman3 extends StatelessWidget {
  const Halaman3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HALAMAN 3'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Pindah Screen'),
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) {
            //       return const Halaman3();
            //     },
            //   ),
            // );
            Navigator.pushReplacementNamed(context, '/halaman1');
          },
        ),
      ),
    );
  }
}
