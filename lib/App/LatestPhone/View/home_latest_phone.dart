import 'package:flutter/material.dart';

import '../../Categories/View/Components/category_tile.dart';

import '../Model/latest_phone.dart';
import 'Components/latest_tile.dart';

class HomeLatestList extends StatelessWidget {
  List<LatestPhoneModel> latestphone;
  HomeLatestList({super.key, required this.latestphone});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: latestphone.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 20),
              child: LatestTile(
                category: latestphone[index],
              ),
            );
          }),
    );
  }
}
