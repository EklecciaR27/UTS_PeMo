import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:main/auth.dart';
import 'package:main/models/profile_service.dart';
import 'package:main/models/user_data.dart';
import '../widgets/bottom_nav.dart';
import 'package:provider/provider.dart';
import '../models/user.dart' as my_models;
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

class ConfirmationPage extends StatefulWidget {
  const ConfirmationPage({Key? key}) : super(key: key);

  @override
  State<ConfirmationPage> createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  final firebase_auth.FirebaseAuth _auth = firebase_auth.FirebaseAuth.instance;
  String? fullName = '';
  final picker = ImagePicker();
  Uint8List? _image;
  String? fotoID;

  @override
  void initState() {
    super.initState();
    fetchFullName();
    _getFirebaseStoragePhotoUrl();
  }

  Future<void> fetchFullName() async {
    try {
      var userProvider = Provider.of<UserData>(context, listen: false);
      var user = userProvider.myUsers.first;

      if (user != null) {
        setState(() {
          fullName = user.fullName;
        });
      }
    } catch (e) {
      print('Error: $e');
    }
  }

Future<Uint8List?> _pickImage(ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);

  if (pickedFile != null) {
    final imageBytes = await pickedFile.readAsBytes();
    return imageBytes;
  } else {
    print("No image selected!");
    return null;
  }
}


void selectImage() async {
  Uint8List? img = await _pickImage(ImageSource.gallery);
  firebase_auth.User? user = _auth.currentUser;

  if (img != null && user != null) {
    try {
      var profileService = ProfileService();
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
        await profileService.updateUserPhotoUrlInFirestore(user, photoUrl, fotoID);

        setState(() {
          _image = img;
        });
      } else {
        print('Error: email user tidak valid');
      }
    } catch (e) {
      print('Error : $e');
    }
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
        print('Error: User tidak ada');
        return '';
      }
    } catch (e) {
      print('Error : $e');
      throw e;
    }
  }

  
  Future<void> _uploadAndSaveImage(Uint8List imageBytes) async {
    try {
      var profileService = ProfileService();
      String photoUrl = await _uploadImageToFirebase(imageBytes);

      var userProvider = Provider.of<UserData>(context, listen: false);
      var user = _auth.currentUser;

      if (user != null) {
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
        await profileService.updateUserPhotoUrlInFirestore(user, photoUrl, fotoID);

        setState(() {
          _image = imageBytes;
        });
      } else {
        print('Error: tidak ada');
      }
    } catch (e) {
      print('Error uploading image: $e');
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
      print('Error: $e');
      return '';
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
                              backgroundImage: MemoryImage(_image!),
                            )
                          : FutureBuilder<String>(
                              future: _getFirebaseStoragePhotoUrl(),
                              builder: (context, snapshot) {
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return CircularProgressIndicator();
                                } else if (snapshot.hasError) {
                                  return Icon(
                                    Icons.person,
                                    color: Color(0xFF25403B),
                                    size: 100,
                                  );
                                } else if (snapshot.hasData &&
                                    snapshot.data != null) {
                                  return CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      snapshot.data!,
                                    ),
                                  );
                                } else {
                                  var userProvider = Provider.of<UserData>(
                                      context,
                                      listen: false);
                                  var users = userProvider.myUsers;

                                  if (users.isNotEmpty) {
                                    var user = users.first;
                                    if (user.foto == snapshot.data) {
                                      return CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          snapshot.data!,
                                        ),
                                      );
                                    }
                                  }
                                  return Icon(
                                    Icons.person,
                                    color: Color(0xFF25403B),
                                    size: 100,
                                  );
                                }
                              },
                            ),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: (lebar - 40) / 2,
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          _pickImage(ImageSource.gallery)
                              .then((imageBytes) =>
                                  _uploadAndSaveImage(imageBytes!))
                              .catchError((error) {
                            print('Error selecting/uploading image: $error');
                          });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
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
