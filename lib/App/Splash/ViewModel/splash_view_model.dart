import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'dart:async';
import 'package:get/get.dart';

import '../../Routes/route_names.dart';

class SplashViewModel extends GetxController {
  Rx<Timer> timer = Timer(Duration.zero, () {}).obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;
    if (user != null) {
      timer.value = Timer(const Duration(seconds: 2), () {
        timer.value.cancel();
        Get.toNamed(RouteNames.rootPage);
      });
    } else {
      timer.value = Timer(const Duration(seconds: 2), () {
        timer.value.cancel();
        Get.toNamed(RouteNames.loginView);
      });
    }

    @override
    void onClose() {
      // TODO: implement onClose
      super.onClose();
      print("close");
    }

    @override
    void dispose() {
      // TODO: implement dispose
      super.dispose();
      print("dispose");
    }
  }
}
