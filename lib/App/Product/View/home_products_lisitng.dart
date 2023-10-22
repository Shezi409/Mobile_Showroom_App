import 'package:flutter/material.dart';

import '../Model/product_model.dart';
import 'Components/product_tile.dart';

class HomeProductsListing extends StatelessWidget {
  final List<ProductModel> products;
  const HomeProductsListing({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 0.8,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10),
          itemCount: products.length,
          itemBuilder: (BuildContext context, int index) {
            return ProductTile(
              productModel: products[index],
            );
          }),
    );
  }
}
