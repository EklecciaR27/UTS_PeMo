import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:main/auth.dart';
import 'package:main/models/user.dart' as my_models;
import 'package:main/models/firestoreservice.dart';
import 'package:main/models/user_data.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfilePage> {
  final TextEditingController _controllerFullName = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPW = TextEditingController();
  final TextEditingController _controllerKonfirm = TextEditingController();
  final FirestoreService _firestoreService = FirestoreService();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Uint8List? _image;

  Future<void> _updateUserProfile() async {
    print('Updating user profile...');
    String? userId = _auth.currentUser?.uid;

    if (userId != null) {
      print('User ID: $userId');
      String newFullName = _controllerFullName.text;

      try {
        await _firestoreService.updateFullName(userId, newFullName);
        print('Nama lengkap berhasil diperbarui');
        Navigator.pop(context, true);
      } catch (e) {
        print('Error updating full name: $e');
        Navigator.pop(context, false);
      }
    } else {
      print('User ID not found. Make sure the user is authenticated.');
    }
  }

  Future<String> _uploadImageToFirebase(Uint8List imageBytes) async {
    try {
      final storage = FirebaseStorage.instance;
      var user = _auth.currentUser;

      if (user != null) {
        String userEmail = user.email!;
        String fotoID = 'Foto_Profil_$userEmail';

        final Reference storageReference =
            storage.ref().child('profile_images/$fotoID.jpg');

        UploadTask uploadTask = storageReference.putData(imageBytes);
        await uploadTask;

        String downloadUrl = await storageReference.getDownloadURL();
        return downloadUrl;
      } else {
        print('Error: User is null.');
        return '';
      }
    } catch (e) {
      print('Error uploading image to Firebase Storage: $e');
      throw e;
    }
  }

  Future<void> _pickAndUploadImage() async {
    Uint8List? img = await _pickImage(ImageSource.gallery);
    firebase_auth.User? user = _auth.currentUser;

    if (img != null && user != null) {
      try {
        var auth = Auth();
        String photoUrl = await _uploadImageToFirebase(img);

        var userProvider = Provider.of<UserData>(context, listen: false);

        if (user.email != null && user.email!.isNotEmpty) {
          String userEmail = user.email!;
          String fotoID = 'Foto_Profil_$userEmail';

          my_models.User updatedUser = my_models.User(
            fullName: user.displayName ?? '',
            email: '',
            password: '',
            confirmPassword: '',
            foto: photoUrl,
          );

          userProvider.updateUserByEmail(userEmail, updatedUser);
          await auth.updateUserPhotoUrlInFirestore(user, photoUrl, fotoID);

          setState(() {
            _image = img;
          });
        } else {
          print('Error: User does not have a valid email.');
        }
      } catch (e) {
        print('Error selecting/uploading image: $e');
      }
    }
  }

  Future<Uint8List?> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      final imageBytes = await pickedFile.readAsBytes();
      return imageBytes;
    } else {
      print("No image selected");
      return null;
    }
  }

  Future<String> _getFirebaseStoragePhotoUrl() async {
    try {
      final firebase_auth.User? user = _auth.currentUser;

      if (user != null) {
        String userEmail = user.email!;
        String fotoID = 'Foto_Profil_$userEmail';
        final Reference storageReference =
            FirebaseStorage.instance.ref().child('profile_images/$fotoID.jpg');
        String downloadUrl = await storageReference.getDownloadURL();
        return downloadUrl;
      } else {
        return '';
      }
    } catch (e) {
      print('Error getting image from Firebase Storage: $e');
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    var lebar = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Positioned(
            top: 45,
            left: (lebar - 110) / 2,
            child: _image != null
                ? CircleAvatar(
                    backgroundImage: MemoryImage(_image!),
                  )
                : FutureBuilder<String>(
                    future: _getFirebaseStoragePhotoUrl(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Icon(
                          Icons.person,
                          color: Color(0xFF25403B),
                          size: 100,
                        );
                      } else if (snapshot.hasData && snapshot.data != null) {
                        return Container(
                          width: 110, // Sesuaikan dengan kebutuhan Anda
                          height: 110,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(snapshot.data!),
                            ),
                          ),
                        );
                      } else {
                        return Icon(
                          Icons.person,
                          color: Color(0xFF25403B),
                          size: 100,
                        );
                      }
                    },
                  ),
          ),
          Positioned(
            top: 143,
            left: (lebar - 33) / 2,
            child: Center(
              child: InkWell(
                onTap: () {
                  _pickAndUploadImage();
                },
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF25403B),
                  ),
                  child: const Icon(
                    Icons.add,
                    color: Color(0xFF8AB0AB),
                    size: 30,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 200,
            child: Container(
              width: 360,
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF26413C),
                    Color.fromARGB(255, 0, 0, 0),
                  ],
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    width: 310,
                    child: TextField(
                      controller: _controllerFullName,
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFF8AB0AB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: "Full Name",
                        hintText: "Full Name",
                        labelStyle: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        hintStyle: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 310,
                    child: TextField(
                      controller: _controllerEmail,
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFF8AB0AB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: "Email",
                        hintText: "Email",
                        labelStyle: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        hintStyle: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 310,
                    child: TextField(
                      controller: _controllerPW,
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFF8AB0AB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: "Password",
                        hintText: "Password",
                        labelStyle: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        hintStyle: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 310,
                    child: TextField(
                      controller: _controllerKonfirm,
                      decoration: InputDecoration(
                        filled: false,
                        fillColor: Colors.white,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(
                            color: Color(0xFF8AB0AB),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        labelText: "Confirm Password",
                        hintText: "Confirm Password",
                        labelStyle: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        hintStyle: GoogleFonts.raleway(
                          textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    width: 250,
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        _updateUserProfile();
                      },
                      style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                              side: BorderSide(
                                color: Color(0xFF8AB0AB),
                                width: 2.0,
                              )),
                        ),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF8AB0AB)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(width: 8, height: 8),
                          Text(
                            "Update Now",
                            style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
