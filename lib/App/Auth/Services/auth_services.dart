import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../Profile/View/profile_view.dart';
import '../../Routes/route_names.dart';

mixin AuthService {
  FirebaseAuth auth = FirebaseAuth.instance;

  registerWithEmailAndPassword({
    required String fName,
    required String phoneNo,
    required String email,
    required String password,
    String? profileimageUrl,
  }) async {
    // assert(profileimageUrl != null);
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(userCredential);
      ProfileView pro = ProfileView();
      final profilepic = pro.profileimageUrl;
      var response =
          await FirebaseFirestore.instance.collection('userslist').add({
        'user_Id': userCredential.user!.uid,
        'user_name': fName,
        'phone_No': phoneNo,
        'imageUrl': profilepic,
        'email': email,
        'password': password,
      });
      if (userCredential.user!.emailVerified == false) {
        userCredential.user!.sendEmailVerification();
        Get.snackbar('Go to Verifiey ', 'Successfully created',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.lightGreen.shade300,
            colorText: Colors.white,
            icon: const Icon(Icons.adb));
        Get.offAllNamed(RouteNames.loginView);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        Get.snackbar('Email Arlready used', 'Enter another Email',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade300,
            colorText: Colors.white,
            icon: const Icon(Icons.error));
      }
      print(e);
    }
  }

  loginWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      print(userCredential);

      if (userCredential.user!.emailVerified == true) {
        Get.snackbar(' Congratulations ', 'Successfully Login',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.lightGreen.shade300,
            colorText: Colors.white,
            icon: const Icon(Icons.adb));
        Get.offAllNamed(RouteNames.rootPage);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar('User Not Found', 'Please Registor',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade300,
            colorText: Colors.white,
            icon: const Icon(Icons.error));
      }
      if (e.code == 'wrong-password') {
        Get.snackbar('Wrong Password', 'Please Enter Valid Password',
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.red.shade300,
            colorText: Colors.white,
            icon: const Icon(Icons.error));
      }
    }
  }
}
