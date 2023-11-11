import 'package:flutter/material.dart';
import 'package:main/signUp.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Input Page',
      theme: ThemeData(
        primarySwatch: Colors.green, // You missed a comma here
        scaffoldBackgroundColor: Colors.black,
      ),
      home: const SignInForm(title: 'Input Review'), // No need for 'const' here
    );
  }
}

class SignInForm extends StatefulWidget {
  const SignInForm({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SignInFormState createState() => _SignInFormState();
   
 
}

class _SignInFormState extends State<SignInForm> {

   final TextEditingController _controllerEmail = TextEditingController();
   final TextEditingController _controllerPW = TextEditingController();
   

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Add Review"),
      // ),
 body: Stack(
  children: <Widget>[
    const SizedBox(height: 10,),
    Container(
      width: 700,
      height: 900,
      padding: const EdgeInsets.only(left: 30, top : 20),
      margin: const EdgeInsets.only(bottom: 10),
      child: const Text("Welcome Back, \nto Flutix",
      style:TextStyle(
        color: Color(0xFFC0CBAD),
        fontSize: 26,
        fontWeight: FontWeight.bold
      ) ,
      )
    ),
    
    Positioned(
      top: 300, // Mengatur posisi ke atas
      right: 0,
      left: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: const Color(0xFF26413C),
        ),
        width: 500,
        height: 900,
        child: Column(
          children: [
          Positioned(
            child: Container(
              margin: const EdgeInsets.only(right: 230, top: 30),
              child: const Text("Sign In",
              style: TextStyle(
                color: Color(0xFFC0CBAD),
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),),
            )
          
          ),
            const SizedBox(height: 40,),
            Container(  
              width: 310,
              child:TextField(
              controller: _controllerEmail,
              decoration: InputDecoration(
                filled: false, // latar belakang
                    fillColor: Colors.white,// warna latar belakang
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                    color: Color(0xFF8AB0AB),
              ),
            ),
            focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                    color: Colors.white,
                  ),
              ),
                    labelText: "Email",
                    hintText: "Email",
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.white
                    ),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ) ,
            ),
            const SizedBox(height: 30,),
            Container(
              width: 310,
              child:TextField(
              controller: _controllerPW,
              decoration: InputDecoration(
                filled: false, // latar belakang
                    fillColor: Colors.white,// warna latar belakang
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(
                    color: Color(0xFF8AB0AB),
              ),
            ),
            focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(
                    color: Colors.white,
                  ),
              ),
                    labelText: "Password",
                    hintText: "Password",
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                    hintStyle: const TextStyle(
                      color: Colors.white
                    ),
              ),
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
              ),
            ) ,
            ),
             

            const SizedBox(height: 40),
                    Container(
                      width: 250, // Atur lebar sesuai kebutuhan Anda
                      height: 40,
                    child :ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Tindakan yang diambil ketika tombol ditekan
                      });
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6.0), 
                        side: const BorderSide(
                          color: Color(0xFF8AB0AB),
                          width: 2.0,
                        )
                        // Radius sudut disesuaikan sesuai kebutuhan Anda
                      ),
                    ),
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Warna teks
                      backgroundColor: MaterialStateProperty.all<Color>(const Color(0xFF8AB0AB)), 
                    ),
                    child: const Row(
                      mainAxisAlignment:MainAxisAlignment.center,
                      children :[
                        
                    SizedBox(width: 8, height: 8  ),
                    Text("Sign In",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400
                    ),
                    ),
                     ],
                    ),

                  ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have an Account?",
                      style: TextStyle(
                        color: Color(0xFF8AB0AB),
                        fontSize: 17,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                      TextButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                        }, 
                        child: const Text("Sign Up",
                        style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                        )
                        )
                    ],
                  ),
                  )
                  
              
          ],
        ),
      ),
    ),
  ],
),

    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SignInPage(),
  ));
}
