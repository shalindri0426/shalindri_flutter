import 'package:flutter/material.dart';
//import 'package:luxe_living/screens/home_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final List<Map<String, String>> categories = [
      {'title': 'Sofas', 'image': '🛋️'},
      {'title': 'Beds', 'image': '🛏️'},
      {'title': 'Chairs', 'image': '🪑'},
      {'title': 'Tables', 'image': '🛒'},
      {'title': 'Lighting', 'image': '💡'},
      {'title': 'Decor', 'image': '🎨'},
      {'title': 'Armchairs', 'image': '🛋'},
      {'title': 'Mirrors', 'image': '🪞'},
      {'title': 'Wallart', 'image': '🖼'},
      {'title': 'Shelves', 'image': '🛒'},
      {'title': 'Office', 'image': '💼'},
      {'title': 'Ornaments', 'image': '🎨'},
      {'title': 'Dressing tables', 'image': '🛋️'},
      {'title': 'Dining Tables', 'image': '🛏️'},
      {'title': 'Kitchen', 'image': '🍽'},
      {'title': 'Tables', 'image': '🛒'},
      {'title': 'Lighting', 'image': '💡'},
      {'title': 'Decor', 'image': '🎨'},
    ];

    return Scaffold(
      appBar: AppBar(
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        title: const Text('Product Categories'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children:
                categories.map((category) {
                  return _buildCategoryCard(
                    context: context,
                    title: category['title']!,
                    emoji: category['image']!,
                    onTap: () {
                      // Navigate or filter products
                    },
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard({
    required BuildContext context,
    required String title,
    required String emoji,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(emoji, style: const TextStyle(fontSize: 32)),
              const SizedBox(height: 8),
              Text(
                title,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
