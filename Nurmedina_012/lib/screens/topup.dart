import 'package:flutter/material.dart';

class topup extends StatelessWidget {
  const topup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TopUpPage(
        amount: '',
      ),
    );
  }
}

class TopUpPage extends StatefulWidget {
  const TopUpPage({super.key, required this.amount});

  final String amount;

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final TextEditingController _amountController = TextEditingController();
  String? amount = '';

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _amountController.addListener(_printLatestValueAmount);
  }

  void _printLatestValueAmount() {
    print('Amount : ${_amountController.text}');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromRGBO(0, 0, 0, 1),
                  ),
                  onPressed: () {},
                  child: Container(
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              width: 289,
              height: 166,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/Wallet Card.PNG"),
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              children: [
                Text(
                  "Amount : ",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Color.fromARGB(255, 138, 176, 171),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 300,
            child: TextFormField(
              decoration: InputDecoration(
                hintText: "IDR.",
                hintStyle: TextStyle(color: Colors.grey),
                labelText: "Amount",
                labelStyle: TextStyle(color: Color.fromARGB(193, 80, 81, 81)),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(193, 1, 143, 122), 
                    width: 1.0, 
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: const Color.fromARGB(255, 138, 176, 171), 
                    width: 1.0, 
                  ),
                ),
              ),
              controller: _amountController,
            ),
          ),
          SizedBox(
            height: 20,
          ),


          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                Text(
                  "Choose The Amount : ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 138, 176, 171),
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side:
                          BorderSide(color: Color.fromARGB(255, 138, 176, 171))),
                  child: Text(
                    'Rp.50.000',
                    style: TextStyle(
                      color: Color.fromARGB(255, 138, 176, 171),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side:
                          BorderSide(color: Color.fromARGB(255, 138, 176, 171))),
                  child: Text(
                    'Rp.100.000',
                    style: TextStyle(
                      color: Color.fromARGB(255, 138, 176, 171),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side:
                          BorderSide(color: Color.fromARGB(255, 138, 176, 171))),
                  child: Text(
                    'Rp.150.000',
                    style: TextStyle(
                      color: Color.fromARGB(255, 138, 176, 171),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side:
                          BorderSide(color: Color.fromARGB(255, 138, 176, 171))),
                  child: Text(
                    'Rp.200.000',
                    style: TextStyle(
                      color: Color.fromARGB(255, 138, 176, 171),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side:
                          BorderSide(color: Color.fromARGB(255, 138, 176, 171))),
                  child: Text(
                    'Rp.300.000',
                    style: TextStyle(
                      color: Color.fromARGB(255, 138, 176, 171),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      side:
                          BorderSide(color: Color.fromARGB(255, 138, 176, 171))),
                  child: Text(
                    'Rp.500.000',
                    style: TextStyle(
                      color: Color.fromARGB(255, 138, 176, 171),
                    ),
                  ),
                ),
              ],
            ),

          ),
          SizedBox(height: 20,),
          SizedBox(
                  height: 40, width: 140,
                  child: ElevatedButton(
                    onPressed: () {
                      //Navigator.pushNamed(context, '/home');
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Color.fromARGB(255, 138, 176, 171), 
                    ),
                    child: Text('Top Up Now',
                    style: TextStyle (
                      color: Colors.white
                    ),),   

                  ),
                ),
        ],
        

        
      ),
    );
  }
}
