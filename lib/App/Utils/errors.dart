import 'dart:js';

import 'package:flutter/material.dart';

class Eroor {
  showError() {
    ScaffoldMessenger.of(context as BuildContext).showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Container(
        padding: const EdgeInsets.all(8),
        height: 70,
        decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: const Center(
          child: Text('This Username is not found! Please try again later'),
        ),
      ),
    ));
  }
}
