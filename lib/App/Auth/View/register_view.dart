import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../ViewModel/registor_view_model.dart';
import 'login_viiew.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final registorVM = Get.find<RegistorViewModel>();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Colors.orange.shade700,
          Colors.orange.shade500,
          Colors.orange.shade400,
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    "Register",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: formKey,
              child: Expanded(
                  child: SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                      )),
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 60,
                        ),
                        Container(
                          // padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Color.fromRGBO(225, 95, 27, .3),
                                  blurRadius: 20,
                                  offset: Offset(0, 10),
                                )
                              ]),
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !RegExp(r'').hasMatch(value)) {
                                      return "Please enter Your Name";
                                    }

                                    return null;
                                  },
                                  controller: registorVM.fName,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Your Name",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      icon: Padding(
                                          padding: EdgeInsets.only(top: 0.0),
                                          child: Icon(Icons.person)),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child: TextFormField(
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !RegExp(r'[0-9]').hasMatch(value)) {
                                      return "Please enter Your Phone No.";
                                    }

                                    return null;
                                  },
                                  controller: registorVM.phoneNo,
                                  decoration: const InputDecoration(
                                      hintText: "03001234567",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      icon: Padding(
                                          padding: EdgeInsets.only(top: 0.0),
                                          child: Icon(Icons.phone)),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                            .hasMatch(value)) {
                                      return "Please enter Your Email";
                                    }

                                    return null;
                                  },
                                  controller: registorVM.email,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Your Email",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      icon: Padding(
                                          padding: EdgeInsets.only(top: 0.0),
                                          child: Icon(Icons.email)),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Colors.grey.shade200)),
                                ),
                                child: TextFormField(
                                  validator: (value) {
                                    if (value == null ||
                                        value.isEmpty ||
                                        value.length < 6) {
                                      return "Password is Required";
                                    }

                                    return null;
                                  },
                                  controller: registorVM.password,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                      hintText: "Enter Your Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      icon: Padding(
                                          padding: EdgeInsets.only(top: 0.0),
                                          child: Icon(Icons.lock)),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              registorVM.onRegistor();
                            }
                          },
                          child: Container(
                            height: 50,
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: Colors.orange.shade500,
                            ),
                            child: const Center(
                              child: Text(
                                "Register",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            onPrimary: Colors.black,
                          ),
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 14),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Image(
                                  image: AssetImage("assets/images/google.png"),
                                  height: 20.0,
                                  width: 24,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 24, right: 8),
                                  child: Text(
                                    'Sign Up with Google',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.black54,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Go back to",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 17,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginView()),
                                );
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: Colors.orange.shade500,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
