import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../ViewModel/splash_view_model.dart';

class SplashView extends StatelessWidget {
  SplashView({super.key});
  final splashVM = Get.find<SplashViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        child: Center(
          child: Container(
            height: 200,
            width: 200,
            child: Center(
              child: Image.asset("assets/images/phonezone.png"),
            ),
          ),
        ),
      ),
    );
  }
}
