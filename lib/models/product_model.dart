import 'package:flutter/material.dart';

class ProductModel {
  final String name, image, description, category;
  final double rating;
  final int review, price;

  List<Color> pcolor;
  List<String> material;
  bool ischeck;

  ProductModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.price,
    required this.review,
    required this.pcolor,
    required this.material,
    required this.description,
    required this.ischeck,
    required this.category,
  });
}

List<ProductModel> luxelivingApp = [
  // product 1
  ProductModel(
    name: "Vienna Sofa",
    image: "assets/images/livingRoom.jpeg",
    rating: 4.3,
    price: 45000,
    review: 23,
    pcolor: [Colors.pink, Colors.black, Colors.blue],
    material: ["Velvet", "Silk"],
    description:
        "Vienna Sofa is a luxurious addition to any living room with elegant design and supreme comfort.",
    ischeck: true,
    category: "Living room",
  ),

  // product 2
  ProductModel(
    name: "Marble Dining Set",
    image: "assets/images/diningSet.jpeg",
    rating: 4.7,
    price: 62000,
    review: 35,
    pcolor: [Colors.brown, Colors.white, Colors.grey],
    material: ["Marble", "Wood"],
    description:
        "This exquisite marble dining set elevates your dining experience with timeless design and durability.",
    ischeck: true,
    category: "Dining",
  ),

  // product 3
  ProductModel(
    name: "Classic Console Table",
    image: "assets/images/hallwayTable.jpeg",
    rating: 4.2,
    price: 25000,
    review: 12,
    pcolor: [Colors.white, Colors.black],
    material: ["Wood", "Glass"],
    description:
        "A sleek hallway console table that blends modern minimalism with practical design.",
    ischeck: true,
    category: "Hallway",
  ),

  // product 4
  ProductModel(
    name: "Ergo Executive Chair",
    image: "assets/images/officeChair.jpeg",
    rating: 4.5,
    price: 38000,
    review: 18,
    pcolor: [Colors.black, Colors.grey],
    material: ["Leather", "Metal"],
    description:
        "An ergonomic executive chair built for comfort, posture support, and style.",
    ischeck: true,
    category: "Office",
  ),

  // product 5
  ProductModel(
    name: "Decorative Wall Art Set",
    image: "assets/images/wallArt.jpeg",
    rating: 4.0,
    price: 12000,
    review: 10,
    pcolor: [Colors.black, Colors.white],
    material: ["Canvas", "Acrylic"],
    description:
        "Set of three abstract canvas wall arts perfect for enriching any space with color and character.",
    ischeck: true,
    category: "Other",
  ),

  // product 6
  ProductModel(
    name: "Oxford King Bed",
    image: "assets/images/bedroomSet.jpeg",
    rating: 4.8,
    price: 75000,
    review: 29,
    pcolor: [Colors.brown, Colors.grey],
    material: ["Wood", "Linen"],
    description:
        "The Oxford King Bed offers a grand presence in your bedroom with solid craftsmanship and plush comfort.",
    ischeck: true,
    category: "Bedroom",
  ),
];
