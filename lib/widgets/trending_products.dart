import 'package:flutter/material.dart';
import 'package:luxe_living/models/product_model.dart'; // Import ProductModel

class TrendingProducts extends StatelessWidget {
  final ProductModel productItem;
  final Size size;

  const TrendingProducts({
    super.key,
    required this.productItem,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      //crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: size.height * 0.25,
          width: size.width * 0.5,
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Align(
              alignment: Alignment.topRight,
              child: CircleAvatar(
                radius: 18,
                backgroundColor: Colors.grey,
                child: Icon(
                  Icons.favorite_border,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.grey.shade200,
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(productItem.image),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          productItem.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        Text(
          "LKR ${productItem.price.toString()}",
          style: TextStyle(color: Colors.green),
        ),
        const SizedBox(width: 5),
        if (productItem.ischeck == true)
          Text(
            "LKR ${productItem.price + 200}.00",
            style: const TextStyle(
              color: Colors.pink,
              fontSize: 12,
              decoration: TextDecoration.lineThrough,
              decorationColor: Colors.grey,
            ),
          ),
      ],
    );
  }
}
