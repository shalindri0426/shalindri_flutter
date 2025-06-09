import 'package:flutter/material.dart';

class ProductModel {
  //defining a custom dart class
  //structure ofthe product model
  final String name, image, description, category;
  final double rating;
  final int review, price;

  List<Color> pcolor; //list of colours
  List<String> material; //list of material types
  bool ischeck;

  //constructor
  //required means all fields must be given when creating a productmodel object
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
    image: "assets/images/sofa1.jpg",
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
    image: "assets/images/diningSet.jpg",
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
    image: "assets/images/hallwayTable.jpg",
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
    image: "assets/images/officeChair.jpg",
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
    image: "assets/images/wallArt.jpg",
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
    image: "assets/images/bed.jpg",
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

  // product 7
  ProductModel(
    name: "Sienna Fabric Sofa",
    image: "assets/images/sofa2.jpeg",
    rating: 4.5,
    price: 42000,
    review: 54,
    pcolor: [Colors.blueGrey, Colors.white],
    material: ["Fabric", "Wood"],
    description:
        "The Sienna Fabric Sofa offers modern elegance and deep comfort, perfect for any living room setup.",
    ischeck: true,
    category: "Living room",
  ),

  // product 8
  ProductModel(
    name: "Aspen Dining Table",
    image: "assets/images/diningTable.jpeg",
    rating: 4.7,
    price: 58000,
    review: 38,
    pcolor: [Colors.brown, const Color.fromARGB(255, 246, 224, 216)],
    material: ["Oak Wood", "Glass"],
    description:
        "A sophisticated oak wood dining table that comfortably seats six and complements any dining space.",
    ischeck: true,
    category: "Dining",
  ),

  // product 9
  ProductModel(
    name: "Harper Office Desk",
    image: "assets/images/officeDesk.jpg",
    rating: 4.3,
    price: 29500,
    review: 21,
    pcolor: [Colors.black, Colors.grey],
    material: ["Metal", "Engineered Wood"],
    description:
        "Streamlined and stylish, the Harper Desk blends form and function for any modern office.",
    ischeck: false,
    category: "Office",
  ),

  // product 10
  ProductModel(
    name: "Aurora Nightstand",
    image: "assets/images/nightstand.jpg",
    rating: 4.6,
    price: 9500,
    review: 15,
    pcolor: [Colors.white, Colors.lightBlueAccent],
    material: ["Pine Wood", "Metal"],
    description:
        "Compact and elegant, the Aurora Nightstand provides convenient storage and classic appeal.",
    ischeck: false,
    category: "Bedroom",
  ),

  // product 11
  ProductModel(
    name: "Zen Outdoor Chair Set",
    image: "assets/images/outdoorSet.jpg",
    rating: 4.4,
    price: 18000,
    review: 33,
    pcolor: [Colors.green, Colors.grey],
    material: ["Rattan", "Aluminum"],
    description:
        "Relax in style with the Zen Outdoor Chair Set, built to withstand the elements and enhance your patio.",
    ischeck: true,
    category: "Hallway",
  ),

  // product 12
  ProductModel(
    name: "Cleo Bookshelf",
    image: "assets/images/bookshelf.jpg",
    rating: 4.2,
    price: 16500,
    review: 19,
    pcolor: [Colors.brown, Colors.black],
    material: ["Engineered Wood", "Steel"],
    description:
        "The Cleo Bookshelf combines industrial and rustic style, with ample room for books and décor.",
    ischeck: false,
    category: "Living room",
  ),
];
