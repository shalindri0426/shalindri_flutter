import 'package:flutter/material.dart';
import 'package:luxe_living/models/category_model.dart';
import 'package:luxe_living/models/product_model.dart';
import 'package:luxe_living/screens/category_products.dart';
import 'package:luxe_living/screens/product_detail_screen.dart';
import 'package:luxe_living/widgets/trending_products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),

            SizedBox(height: 20),

            // Banner image
            Image.asset("assets/images/mainbanner.png"),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop by category",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 10),

            // Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  category.length,
                  (index) => InkWell(
                    onTap: () {
                      final filterItems = luxelivingApp
                          .where((item) =>
                              item.category.toLowerCase() ==
                              category[index].name.toLowerCase())
                          .toList();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CategoryProducts(
                            category: category[index].name,
                            categoryProducts: filterItems,
                          ),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(
                              category[index].image,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(category[index].name),
                      ],
                    ),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending Now",
                    style: TextStyle(
                      fontSize: 16,
                      letterSpacing: 1,
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
            ),

            // Trending products
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(luxelivingApp.length, (index) {
                  final productItems = luxelivingApp[index];
                  return Padding(
                    padding: index == 0
                        ? const EdgeInsets.symmetric(horizontal: 20)
                        : const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => ProductDetailScreen(
                              ProductItem: productItems,
                            ),
                          ),
                        );
                      },
                      child: TrendingProducts(
                        productItem: productItems,
                        size: size,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
