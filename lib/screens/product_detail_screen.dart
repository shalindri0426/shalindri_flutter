import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:luxe_living/models/product_model.dart';
import 'package:luxe_living/widgets/trending_products.dart';
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
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text("Product Detail"),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(Icons.shopping_cart, size: 28),
              Positioned(
                right: -3,
                top: -5,
                child: Container(
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      "3",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
        ],
      ),
      body: ListView(
        children: [
          Container(
            color: const Color.fromARGB(255, 246, 208, 253),
            height: size.height * 0.46,
            width: size.width,
            child: PageView.builder(
              onPageChanged: (value) {
                setState(() {
                  currentIndex = value;
                });
              },
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
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        3,
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: EdgeInsets.only(right: 4),
                          width: 7,
                          height: 7,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color:
                                index == currentIndex
                                    ? Colors.blue
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
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.ProductItem.name,
                  maxLines: 1,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "LKR ${widget.ProductItem.price.toString()}",
                  style: TextStyle(color: Colors.green),
                ),
                const SizedBox(width: 5),
                if (widget.ProductItem.ischeck == true)
                  Text(
                    "LKR ${widget.ProductItem.price + 200}.00",
                    style: const TextStyle(
                      color: Colors.pink,
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      decorationColor: Colors.grey,
                    ),
                  ),
                SizedBox(height: 15),
                Text(
                  "${widget.ProductItem.description}",
                  style: TextStyle(fontSize: 14),
                ),

                //for colour
                const SizedBox(height: 20),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 2.1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Colour",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  widget.ProductItem.pcolor.asMap().entries.map(
                                    (entry) {
                                      final int index = entry.key;
                                      final color = entry.value;
                                      return GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            selectedColorIndex = index;
                                          });
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: CircleAvatar(
                                            radius: 18,
                                            backgroundColor: color,
                                            child:
                                                selectedColorIndex == index
                                                    ? Icon(
                                                      Icons.check,
                                                      color: Colors.white,
                                                      size: 18,
                                                    )
                                                    : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ).toList(),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // For material
                    SizedBox(
                      width: size.width / 2.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Material",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children:
                                  widget.ProductItem.material
                                      .asMap()
                                      .entries
                                      .map((entry) {
                                        final int index = entry.key;
                                        final String material = entry.value;
                                        return GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSizeIndex = index;
                                            });
                                          },
                                          child: Container(
                                            margin: EdgeInsets.only(right: 10),
                                            height: 35,
                                            width: 60,
                                            decoration: BoxDecoration(
                                              color:
                                                  selectedSizeIndex == index
                                                      ? Colors.black
                                                      : Colors.white,
                                              border: Border.all(
                                                color:
                                                    selectedSizeIndex == index
                                                        ? Colors.black
                                                        : const Color.fromARGB(
                                                          95,
                                                          0,
                                                          0,
                                                          0,
                                                        ),
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Center(
                                              child: Text(
                                                material,
                                                style: TextStyle(
                                                  color:
                                                      selectedSizeIndex == index
                                                          ? Colors.white
                                                          : Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 10,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      })
                                      .toList(),
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

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.white,
        elevation: 0,
        label: SizedBox(
          width: size.width * 0.9,
          child: Row(
            //add tocart
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Item added to cart!"),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.greenAccent,
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    elevation: 0,
                    side: BorderSide(color: Colors.black),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.shopping_cart, color: Colors.black),
                        SizedBox(width: 5),
                        Text(
                          "ADD TO CART",
                          style: TextStyle(
                            color: Colors.black,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),

              //buy now button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PlaceOrderForm(),
                      ),
                    );
                  },

                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 18),
                    color: Colors.black,
                    child: Center(
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
