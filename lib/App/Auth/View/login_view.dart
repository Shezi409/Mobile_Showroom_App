// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:get/get.dart';

// import '../ViewModel/login_view_model.dart';

// class LoginView extends StatelessWidget {
//   const LoginView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final loginVM = Get.find<LoginViewModel>();
//     final formKey = GlobalKey<FormState>();
//     return Scaffold(
//       body: SafeArea(
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 children: [
//                   const SizedBox(
//                     height: 40,
//                   ),
//                   const Text(
//                     "Welcome to\n Mobile Zone",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontStyle: FontStyle.normal,
//                       fontSize: 30,
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 70,
//                   ),
//                   TextFormField(
//                     validator: (value) {
//                       if (value == null ||
//                           value.isEmpty ||
//                           !RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
//                               .hasMatch(value)) {
//                         return "Please enter valid Email";
//                       }

//                       return null;
//                     },
//                     controller: loginVM.email,
//                     decoration: const InputDecoration(
//                         hintText: "Email", border: OutlineInputBorder()),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   TextFormField(
//                     validator: (value) {
//                       if (value == null || value.isEmpty || value.length < 6) {
//                         return "Password is Required";
//                       }

//                       return null;
//                     },
//                     controller: loginVM.password,
//                     obscureText: true,
//                     decoration: const InputDecoration(
//                         hintText: "Password", border: OutlineInputBorder()),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   MaterialButton(
//                     color: Colors.amber.shade700,
//                     shape: const StadiumBorder(),
//                     clipBehavior: Clip.antiAlias,
//                     onPressed: () {
//                       if (formKey.currentState!.validate()) {
//                         loginVM.onLogin();
//                       }
//                     },
//                     height: 54,
//                     minWidth: MediaQuery.of(context).size.width,
//                     child: const Text("Login"),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//     // );
//   }
// }
