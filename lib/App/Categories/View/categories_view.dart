import 'package:flutter/material.dart';

class CategoriesView extends StatelessWidget {
  CategoriesView({super.key});
  List<String> categories = ["Laptop", "Shoes", "Mobile", "Clothes"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Categories"),
      ),
      backgroundColor: Colors.orange,

      // body: SizedBox(

      //     width: MediaQuery.of(context).size.width,
      //     height: MediaQuery.of(context).size.height,
      //     child: Padding(
      //       padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
      //       child: GridView.builder(

      //           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      //               crossAxisCount: 2,

      //               mainAxisSpacing: 10,
      //               crossAxisSpacing: 10),
      //           itemCount: categories.length,
      //           itemBuilder: (BuildContext context, int index) {
      //             return  CategoryTile(category: categories[index],);
      //           }),
      //     )),
    );
  }
}
