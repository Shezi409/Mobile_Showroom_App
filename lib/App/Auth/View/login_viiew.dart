import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile_zone/App/Auth/View/register_view.dart';
import 'package:get/get.dart';
import '../../FIrebaseWork/get_data_view.dart';
import '../../Routes/route_names.dart';
import '../ViewModel/login_view_model.dart';
import 'package:mobile_zone/App/Auth/Services/social_auth_services.dart';

class LoginView extends StatelessWidget with SocialAuthService {
  LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final loginVM = Get.find<LoginViewModel>();
    final formKey = GlobalKey<FormState>();

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
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome to Mobile Zone",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
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
                                        !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
                                            .hasMatch(value)) {
                                      return "Please enter valid Email";
                                    }

                                    return null;
                                  },
                                  controller: loginVM.email,
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
                                  controller: loginVM.password,
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
                          onTap: () {},
                          child: const Text(
                            "Forgot Password",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        InkWell(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              loginVM.onLogin();
                            }
                            // Fluttertoast.showToast(
                            //     msg: "Login Successfully",
                            //     toastLength: Toast.LENGTH_SHORT,
                            //     gravity: ToastGravity.BOTTOM,
                            //     timeInSecForIosWeb: 1,
                            //     backgroundColor: Colors.orange.shade300,
                            //     textColor: Colors.white,
                            //     fontSize: 16.0);
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
                                "Login",
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
                          onPressed: () async {
                            await onGoogleAuth();
                            //   Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //           builder: (context) => GetDataView()));
                          },
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
                                    'Sign in with Google',
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
                              "You Don't Have Account",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 15,
                              ),
                            ),
                            const SizedBox(
                              width: 12,
                            ),
                            InkWell(
                              onTap: () {
                                Get.toNamed(RouteNames.registorView);
                              },
                              child: Text(
                                "Register",
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
