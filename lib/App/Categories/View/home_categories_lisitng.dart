import 'package:flutter/material.dart';

import '../Model/category_model.dart';
import 'Components/category_tile.dart';

class HomeCategoriesList extends StatelessWidget {
  List<CategoryModel> categories;
  HomeCategoriesList({super.key, required this.categories});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: categories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CategoryTile(
                category: categories[index],
              ),
            );
          }),
    );
  }
}
