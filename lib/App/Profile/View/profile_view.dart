import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  get profileimageUrl => null;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  // final String firestoreImageUrl =
  //     'https://firebasestorage.googleapis.com/v0/b/mobile-zone-959f3.appspot.com/o/images%2FXWP6iI4P8vSDJ75xWgQo23OE2xN2-2023-08-26%2002%3A13%3A11.455302.png?alt=media&token=37755ff0-d43d-432d-97f4-48dbad2b69ec';
  String uploadedImageUrl = '';
  File? pickedImage;
  String? profileimageUrl;
  final ImagePicker _picker = ImagePicker();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            // const CircleAvatar(
            //   radius: 70,
            //   backgroundImage: AssetImage('assets/images/vivov25e.jpg'),
            // ),

            Align(
              alignment: Alignment.center,
              child: Stack(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.indigo, width: 5),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(100),
                        ),
                      ),
                      child: ClipOval(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ignore: unnecessary_null_comparison
                            if (uploadedImageUrl != null)
                              Image.network(
                                uploadedImageUrl,
                                width: 150,
                                height: 150,
                                fit: BoxFit.contain,
                              ),
                          ],
                        ),
                      )),
                  Positioned(
                    bottom: 0,
                    right: 5,
                    child: IconButton(
                      onPressed: imagePickerOption,
                      icon: const Icon(
                        Icons.add,
                        color: Colors.blue,
                        size: 40,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 16),
            Expanded(
              child: ElevatedButton(
                onPressed: pickedImage != null ? _uploadImage : null,
                child: const Text('Upload Image'),
              ),
            ),

            const SizedBox(height: 20),
            itemProfile('Name', 'Ahad Hashmi', CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile('Phone', '03107085816', CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile(
                'Address', 'abc address, xyz city', CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile(
                'Email', 'ahadhashmideveloper@gmail.com', CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Edit Profile')),
            )
          ],
        ),
      ),
    );
  }

  void imagePickerOption() {
    Get.bottomSheet(
      SingleChildScrollView(
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10.0),
            topRight: Radius.circular(10.0),
          ),
          child: Container(
            color: Colors.white,
            height: 250,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Pic Image From",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.camera);
                    },
                    icon: const Icon(Icons.camera),
                    label: const Text("CAMERA"),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      pickImage(ImageSource.gallery);
                    },
                    icon: const Icon(Icons.image),
                    label: const Text("GALLERY"),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.close),
                    label: const Text("CANCEL"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  pickImage(ImageSource imageType) async {
    try {
      final photo = await ImagePicker().pickImage(source: imageType);
      if (photo == null) return;
      final tempImage = File(photo.path);
      setState(() {
        pickedImage = tempImage;
      });

      Get.back();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }

  // Future<void> _uploadImage() async {
  //   final user = _firebaseAuth.currentUser!;
  //   final fileName = '${user.uid}-${DateTime.now().millisecondsSinceEpoch}.jpg';
  //   final imageRef = _firebaseStorage.ref().child(fileName);
  //   final task = imageRef.putFile(pickedImage!);

  //   task.whenComplete(() async {
  //     // final imageUrl = await imageRef.getDownloadURL();
  //     final storageRef =
  //         FirebaseStorage.instance.ref().child('images/my_image.jpg');
  //     String imageUrl = await storageRef.getDownloadURL();
  //     await FirebaseFirestore.instance
  //         .collection('images')
  //         .doc('my_image')
  //         .set({
  //       'imageUrl': imageUrl,
  //     });
  //     setState(() {
  //       profileimageUrl = imageUrl;
  //     });
  //   });
  // }

  Future<void> _uploadImage() async {
    // ignore: deprecated_member_use
    // final pickedFile = await _picker.getImage(source: ImageSource.gallery);
    // if (pickedFile == null) return;

    final user = _firebaseAuth.currentUser!;

    // Upload image to Firebase Cloud Storage
    final storageRef = firebase_storage.FirebaseStorage.instance
        .ref()
        .child('images/${user.uid}-${DateTime.now()}.png');
    await storageRef.putFile(File(pickedImage!.path));

    // Get the download URL of the uploaded image
    final imageUrl = await storageRef.getDownloadURL();

    print(imageUrl);

    setState(() {
      uploadedImageUrl = imageUrl;
      print(uploadedImageUrl);
    });

    // Save the image URL in Firestore
    FirebaseFirestore.instance.collection('images').add({'url': imageUrl});
  }
}
