import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> categories = [
      {'title': 'Sofas', 'image': '🛋️'},
      {'title': 'Beds', 'image': '🛏️'},
      {'title': 'Chairs', 'image': '🪑'},
      {'title': 'Tables', 'image': '🛒'},
      {'title': 'Lighting', 'image': '💡'},
      {'title': 'Decor', 'image': '🎨'},
      {'title': 'Sofas', 'image': '🛋️'},
      {'title': 'Beds', 'image': '🛏️'},
      {'title': 'Chairs', 'image': '🪑'},
      {'title': 'Tables', 'image': '🛒'},
      {'title': 'Lighting', 'image': '💡'},
      {'title': 'Decor', 'image': '🎨'},
      {'title': 'Sofas', 'image': '🛋️'},
      {'title': 'Beds', 'image': '🛏️'},
      {'title': 'Chairs', 'image': '🪑'},
      {'title': 'Tables', 'image': '🛒'},
      {'title': 'Lighting', 'image': '💡'},
      {'title': 'Decor', 'image': '🎨'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Categories',
        style: TextStyle(
          color: Color.fromARGB(255, 0, 0, 0),
        ),),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categories.map((category) {
                  return _buildCategoryCard(
                    title: category['title']!,
                    emoji: category['image']!,
                    onTap: () {
                      // Navigate or filter products
                    },
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required String title,
    required String emoji,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: Colors.teal[100],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(height: 8),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
