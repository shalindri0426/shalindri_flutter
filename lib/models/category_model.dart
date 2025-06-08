class Category {
  final String name, image;
  Category({required this.name, required this.image});
}

List<Category> category = [
  Category(name: "Living room", image: "assets/images/livingRoom.jpeg"),
  Category(name: "Bedroom", image: "assets/images/bedroom.jpeg"),
  Category(name: "Dining", image: "assets/images/dining.jpg"),
  Category(name: "Hallway", image: "assets/images/hallway.jpeg"),
  Category(name: "Office", image: "assets/images/office.jpg"),
  Category(name: "Other", image: "assets/images/office.jpg"),
];

List<String> filterCategory = [
  "filter",
  "price",
  "colour",
  "ratings",
  ];
