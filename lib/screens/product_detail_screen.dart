import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_living/models/product_model.dart';
import 'package:luxe_living/screens/placeOrder_screen.dart';

class ProductDetailScreen extends StatefulWidget {
  final ProductModel ProductItem;
  const ProductDetailScreen({super.key, required this.ProductItem});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  int currentIndex = 0;
  int selectedColorIndex = 0;
  int selectedSizeIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theme.colorScheme.background,
        title: Text(
          "Product Detail",
          style: GoogleFonts.poppins(),
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.shopping_cart, size: 28, color: theme.iconTheme.color),
              Positioned(
                right: -3,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.error,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    "3",
                    style:TextStyle(
                      color: Colors.white, 
                      fontWeight: FontWeight.bold,
                      ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: theme.colorScheme.surfaceVariant,
            height: size.height * 0.46,
            width: size.width,
            child: PageView.builder(
              onPageChanged: (value) => setState(() => currentIndex = value),
              itemCount: 3,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Image.asset(
                      widget.ProductItem.image,
                      height: size.height * 0.4,
                      width: size.width * 0.85,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 4),
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: index == currentIndex
                                ? theme.colorScheme.primary
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.ProductItem.name,
                  style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  "LKR ${widget.ProductItem.price}",
                  style: GoogleFonts.poppins(color: theme.colorScheme.secondary),
                ),
                if (widget.ProductItem.ischeck == true)
                  Text(
                    "LKR ${widget.ProductItem.price + 200}.00",
                    style:  GoogleFonts.poppins(
                      color: Colors.pink,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                    ),
                  ),
                const SizedBox(height: 15),
                Text(
                  widget.ProductItem.description,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 20),

                // Color Selector
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Colour", style: theme.textTheme.bodyLarge),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.ProductItem.pcolor.asMap().entries.map((entry) {
                                final int index = entry.key;
                                final color = entry.value;
                                return GestureDetector(
                                  onTap: () => setState(() => selectedColorIndex = index),
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: CircleAvatar(
                                      radius: 18,
                                      backgroundColor: color,
                                      child: selectedColorIndex == index
                                          ? const Icon(Icons.check, color: Colors.white, size: 18)
                                          : null,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Material Selector
                    SizedBox(
                      width: size.width / 2.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Material", style: theme.textTheme.bodyLarge),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: widget.ProductItem.material.asMap().entries.map((entry) {
                                final int index = entry.key;
                                final material = entry.value;
                                final isSelected = selectedSizeIndex == index;
                                return GestureDetector(
                                  onTap: () => setState(() => selectedSizeIndex = index),
                                  child: Container(
                                    margin: const EdgeInsets.only(right: 10),
                                    height: 35,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      color: isSelected
                                          ? theme.colorScheme.onSurface
                                          : theme.colorScheme.background,
                                      border: Border.all(
                                        color: isSelected
                                            ? theme.colorScheme.onBackground
                                            : Colors.grey,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Center(
                                      child: Text(
                                        material,
                                        style: GoogleFonts.poppins(
                                          color: isSelected
                                              ? theme.colorScheme.background
                                              : theme.colorScheme.onBackground,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 10,
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),

      // Bottom Buttons
      bottomNavigationBar: Padding(
  padding: const EdgeInsets.fromLTRB(18, 0, 18, 20),
  child: Row(
    children: [
      Expanded(
        child: ElevatedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Item added to cart!"),
                duration: Duration(seconds: 2),
                backgroundColor: Colors.greenAccent,
              ),
            );
          },
          icon: Icon(Icons.shopping_cart, color: theme.colorScheme.onBackground),
          label: Text(
            "ADD TO CART",
            style: GoogleFonts.poppins(
              color: theme.colorScheme.onBackground,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.background,
            elevation: 0,
            side: BorderSide(color: theme.colorScheme.onBackground),
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
        ),
      ),
      const SizedBox(width: 10),
      Expanded(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlaceOrderForm()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: theme.colorScheme.onBackground,
            padding: const EdgeInsets.symmetric(vertical: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          ),
          child: Text(
            "BUY NOW",
            style: GoogleFonts.poppins(
              color: theme.colorScheme.background,
              letterSpacing: 1,
            ),
          ),
        ),
      ),
    ],
  ),
),

    );
  }
}
