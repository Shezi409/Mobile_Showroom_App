import 'package:flutter/material.dart';
import '../Model/featured_model.dart';
import 'Components/featured_tile.dart';

class HomeFeaturedList extends StatelessWidget {
  List<FeaturedModel> featured;
  HomeFeaturedList({super.key, required this.featured});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: featured.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: FeaturedTile(
                category: featured[index],
              ),
            );
          }),
    );
  }
}
