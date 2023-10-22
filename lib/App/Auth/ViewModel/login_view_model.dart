import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Services/auth_services.dart';

class LoginViewModel extends GetxController with AuthService {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  onLogin() async {
    await loginWithEmailAndPassword(
      email: email.value.text,
      password: password.value.text,
    );
  }
}
