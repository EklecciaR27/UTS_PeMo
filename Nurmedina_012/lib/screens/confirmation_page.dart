import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:main/auth.dart';
import 'package:main/models/topupAmount.dart';
import 'package:main/models/topup_amount_data.dart';
import 'package:main/models/user_data.dart';
import '../models/user.dart';
import '../widgets/bottom_nav.dart';
import 'home_movie_page.dart';
import 'package:provider/provider.dart';

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  String? fullName = '';
  File? profileImage;
  final picker = ImagePicker();
  Uint8List? _image;

  void initState() {
    super.initState();
    fetchFullName();
    
  }

  void fetchFullName() async {
    try {
      var userProvider = Provider.of<UserData>(context, listen: false);
      var user = userProvider.myUsers.first;

      if (user != null) {
        setState(() {
          fullName = user.fullName;
        });
      }
    } catch (e) {
      print('Error fetching full name: $e');
    }
  }

  _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    // if (pickedFile != null) {
    //   setState(() {
    //     profileImage = File(pickedFile.path);
    //   });
    //   _uploadImageToFirebase();
    // }
    if (pickedFile != null){
      return await pickedFile.readAsBytes();
    }
    print ("tidak ada gambar");
  }
void selectImage() async {
  Uint8List img = await _pickImage(ImageSource.gallery);

  try {
    // Upload image to Firebase Storage and update user's photo URL
    String photoUrl = await _uploadImageToFirebase(img);

    // Update the local user model
    var userProvider = Provider.of<UserData>(context, listen: false);
    userProvider.updateUserPhotoUrl(photoUrl);

    setState(() {
      _image = img;
    });
  } catch (e) {
    print('Error selecting image: $e');
  }
}

Future<String> _uploadImageToFirebase(Uint8List imageBytes) async {
  try {
    final storage = FirebaseStorage.instance;
    final Reference storageReference =
        storage.ref().child('profile_images/${DateTime.now().millisecondsSinceEpoch}');

    UploadTask uploadTask = storageReference.putData(imageBytes);
    TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() => null);

    String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    // Update the user's photo URL in Firestore
    var userProvider = Provider.of<UserData>(context, listen: false);
    var auth = Auth();

    // Assuming you have a user object available in your state
    var users = userProvider.myUsers;

    if (users.isNotEmpty) {
      var user = users.first;

      // Check if the user already has a photo URL in Firestore
      if (user.foto != null && user.foto.isNotEmpty) {
        // User already has a photo URL, no need to update
        print('User already has a photo URL: ${user.foto}');
        return user.foto;
      } else {
        // User doesn't have a photo URL, update Firestore with the new URL
        await auth.updateUserPhotoUrlInFirestore(context, user, downloadUrl);
        print('User photo URL updated in Firestore: $downloadUrl');
        return downloadUrl;
      }
    } else {
      print('No user found in the userProvider');
      return ''; // Handle the case where no user is found
    }
  } catch (e) {
    print('Error uploading image to Firebase Storage: $e');
    throw e;
  }
}




  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xFF1A1D1A), // warna latar belakang
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              Container(
                width: double.infinity,
                height: 30,
                child: const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'Confirm', // teks
                    style: TextStyle(
                      fontSize: 25, // ukuran teks
                      color: Color(0xFFC0CAAD), // warna teks
                      fontWeight: FontWeight.bold, // membuat teks tebal
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 30,
                child: const Padding(
                  padding: EdgeInsets.only(left: 50),
                  child: Text(
                    'New Account', // teks
                    style: TextStyle(
                      fontSize: 25, // ukuran teks
                      color: Color(0xFFC0CAAD), // warna teks
                      fontWeight: FontWeight.bold, // membuat teks tebal
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      height: 170,
                      width: double.infinity,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 130,
                      height: 130,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF8AB0AB),
                      ),
                      child: _image != null
                          ? CircleAvatar(
                              backgroundImage : MemoryImage(_image!),
                              
                            )
                          : const Icon(
                              Icons.person,
                              color: Color(0xFF25403B),
                              size: 100,
                            ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: (lebar - 40) / 2,
                    child: Center(
                      child: InkWell(
                        onTap: selectImage,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color(0xFF25403B),
                          ),
                          child:  const Icon(
                                  Icons.add,
                                  color: Color(0xFF8AB0AB),
                                  size: 30,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Container(
                width: double.infinity,
                height: 30,
                child: const Center(
                  child: Text(
                    'Welcome,', // teks
                    style: TextStyle(
                      fontSize: 25, // ukuran teks
                      color: Color(0xFFC0CAAD), // warna teks
                    ),
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                width: double.infinity,
                height: 30,
                child: Center(
                  child: Text(
                    '$fullName', // Menggunakan fullName yang sudah diambil
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFFC0CAAD),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 80),
              Container(
                height: 80,
                width: lebar,
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 50),
                      child: Text(
                        'Yes, I am in',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF8AB0AB),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(),
                    ),
                    InkWell(
                      onTap: () {
                        _uploadImageToFirebase(_image!);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BottomNav(),
                        ));
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 50, left: 50),
                        child: Icon(
                          Icons.arrow_forward,
                          color: Color(0xFF8AB0AB),
                          size: 40,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
