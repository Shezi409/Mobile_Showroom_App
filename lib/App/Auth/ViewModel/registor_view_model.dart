import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../Routes/route_names.dart';
import '../Services/auth_services.dart';

class RegistorViewModel extends GetxController with AuthService {
  TextEditingController fName = TextEditingController();
  TextEditingController phoneNo = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  onRegistor() async {
    await registerWithEmailAndPassword(
      fName: fName.value.text,
      phoneNo: phoneNo.value.text,
      email: email.value.text,
      password: password.value.text,
    );
  }
}
