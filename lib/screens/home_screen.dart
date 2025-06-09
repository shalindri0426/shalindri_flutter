import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
    final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner image
            Image.asset("assets/images/mainbanner.png"),
            const SizedBox(height: 20),

            // Section: Shop by category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop by category",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: colorScheme.secondary),
                  ),
                ],
              ),
            ),

            // Categories
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: List.generate(category.length, (index) {
                  final currentCategory = category[index];
                  return InkWell(
                    onTap: () {
                      final filtered =
                          luxelivingApp
                              .where(
                                (item) =>
                                    item.category.toLowerCase() ==
                                    currentCategory.name.toLowerCase(),
                              )
                              .toList();

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (_) => CategoryProducts(
                                category: currentCategory.name,
                                categoryProducts: filtered,
                              ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(currentCategory.image),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            currentCategory.name,
                            style: textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),

            const SizedBox(height: 10),

            // Section: Trending Now
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Trending Now",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: colorScheme.secondary),
                  ),
                ],
              ),
            ),

            // Trending products
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: List.generate(luxelivingApp.length, (index) {
                  final product = luxelivingApp[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    ProductDetailScreen(ProductItem: product),
                          ),
                        );
                      },
                      child: TrendingProducts(productItem: product, size: size),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 10),

            // Section: Recently viewed
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Recently Viewed",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                      letterSpacing: 1,
                    ),
                  ),
                  Text(
                    "See all",
                    style: GoogleFonts.poppins(color: colorScheme.secondary),
                  ),
                ],
              ),
            ),

            //Recently viewed products
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20),
              child: Row(
                children: List.generate(luxelivingApp.length, (index) {
                  final product = luxelivingApp[index];
                  return Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) =>
                                    ProductDetailScreen(ProductItem: product),
                          ),
                        );
                      },
                      child: TrendingProducts(productItem: product, size: size),
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
