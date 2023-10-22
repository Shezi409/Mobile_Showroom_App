import 'package:flutter/material.dart';

import '../../Model/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 150,
      decoration: BoxDecoration(
          color: Colors.green, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(image: AssetImage(productModel.path)),
          const SizedBox(
            height: 20,
          ),
          Text(productModel.name),
          Text(productModel.price.toString()),
        ],
      ),
    );
  }
}
