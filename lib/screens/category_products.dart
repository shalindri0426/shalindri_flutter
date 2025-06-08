import 'package:flutter/material.dart';
import 'package:luxe_living/models/product_model.dart';
import 'package:luxe_living/models/category_model.dart';
import 'package:luxe_living/models/subcategory_model.dart';

class CategoryProducts extends StatelessWidget {
  final String category;
  final List<ProductModel> categoryProducts;

  const CategoryProducts({
    super.key,
    required this.category,
    required this.categoryProducts,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Filter subcategories based on the main category
    final filteredSubcategories = subcategory
        .where((sub) => sub.category.toLowerCase() == category.toLowerCase())
        .toList();

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(category, style: theme.textTheme.bodyLarge),
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, color: colorScheme.onPrimary),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                height: 40,
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(5),
                    hintText: "$category Furnitures",
                    hintStyle: theme.textTheme.bodySmall,
                    filled: true,
                    fillColor: theme.cardColor,
                    prefixIcon: Icon(Icons.search, color: colorScheme.onSecondary),
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Filter Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    filterCategory.length,
                    (index) => Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: colorScheme.onSecondary),
                        ),
                        child: Row(
                          children: [
                            Text(filterCategory[index], style: theme.textTheme.bodySmall),
                            const SizedBox(width: 5),
                            Icon(
                              index == 0 ? Icons.filter_list : Icons.keyboard_arrow_down,
                              size: 15,
                              color: colorScheme.onSecondary,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            // Subcategories Horizontal List
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filteredSubcategories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: InkWell(
                      onTap: () {
                        // TODO: Handle subcategory tap
                      },
                      child: Chip(
                        label: Text(filteredSubcategories[index].name,
                            style: theme.textTheme.bodySmall),
                        backgroundColor: theme.cardColor,
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 10),

            // Products Grid
            Expanded(
              child: categoryProducts.isEmpty
                  ? Center(
                      child: Text(
                        "No items available in this category.",
                        style: TextStyle(fontSize: 20, color: Colors.red[300]),
                      ),
                    )
                  : GridView.builder(
                      itemCount: categoryProducts.length,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (context, index) {
                        final productItem = categoryProducts[index];
                        return GestureDetector(
                          onTap: () {
                            // TODO: Navigate to product detail
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: size.height * 0.25,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: theme.cardColor,
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(productItem.image),
                                  ),
                                ),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor: colorScheme.primary.withOpacity(0.7),
                                      child: const Icon(
                                        Icons.favorite_border,
                                        color: Colors.white,
                                        size: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                productItem.name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: theme.textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "LKR ${productItem.price.toString()}",
                                style: TextStyle(color: Colors.green.shade600),
                              ),
                              if (productItem.ischeck == true)
                                Text(
                                  "LKR ${productItem.price + 200}.00",
                                  style: const TextStyle(
                                    color: Colors.pink,
                                    fontSize: 12,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
