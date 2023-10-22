import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../RootPage/root_page.dart';
import '../../Routes/route_names.dart';

mixin SocialAuthService {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore db = FirebaseFirestore.instance;

  onGoogleAuth() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount =
          await googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuth =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuth.accessToken,
        idToken: googleSignInAuth.idToken,
      );

      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      final User? user = userCredential.user;

      ///Firestore Database
      // db.collection("users").doc(user!.uid).update({

      // });
      DocumentSnapshot documentSnapshot =
          await db.collection("users").doc(user!.uid).get();
      if (documentSnapshot.exists) {
        Get.offAllNamed(RouteNames.rootPage);
      } else {
        ///create new user
        db.collection("users").doc(user.uid).set({
          "name": userCredential.user!.displayName,
          "email": userCredential.additionalUserInfo!.profile!["email"],
          'profilepic': userCredential.additionalUserInfo!.profile!["picture"],
          "id": user.uid,
        }, SetOptions(merge: true));

        ///
        Get.offAll(const RootPage());
      }
      Get.offAllNamed(RouteNames.rootPage);
      // Handle signed in user
    } catch (error) {
      // Handle sign-in error
    }
  }
}
