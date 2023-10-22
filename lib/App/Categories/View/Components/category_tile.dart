import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../Model/category_model.dart';

class CategoryTile extends StatelessWidget {
  final CategoryModel category;
  const CategoryTile({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110,
      height: 190,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 10,
            offset: Offset(0, 3),
          )
        ],
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0),
        child: Column(
          children: [
            Container(
              // alignment: Alignment.center,
              child: Image.asset(
                category.path,
                height: 110,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(5)),
              width: 90,
              child: Center(
                child: Text(
                  category.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            RatingBar.builder(
              initialRating: 4,
              minRating: 1,
              direction: Axis.horizontal,
              itemCount: 5,
              itemSize: 14,
              itemPadding: EdgeInsets.symmetric(horizontal: 4),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber.shade700,
              ),
              onRatingUpdate: (index) {},
            ),
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$1200",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.amber.shade600,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Icon(
                    Icons.favorite_border,
                    color: Colors.amber.shade300,
                    size: 22,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
