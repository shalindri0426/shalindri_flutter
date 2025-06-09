import 'package:flutter/material.dart';
//import 'package:luxe_living/screens/home_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
  }); //allows parent widgets touniquely identify this widget

  @override
  Widget build(BuildContext context) {
    //uses colours according to defined theme data
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final List<Map<String, String>> categories = [
      //defining a list of categries using map objects - key value pairs
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
        //top bar of the screen
        foregroundColor: colorScheme.onPrimary,
        backgroundColor: colorScheme.primary,
        title: const Text('Product Categories'),
        centerTitle: true, //ceters the title acccording to screen
      ),
      body: Padding(
        //space around the content
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          //allows scrolling vertically when content overflows
          child: Wrap(
            //lays out thechildren horizontally and wraps to next line according to screen size
            spacing: 10, //horizontal space bteween items
            runSpacing: 10, //vertical space between items
            children:
                categories.map((category) {
                  //.map() converts each category to a UI card
                  return _buildCategoryCard(
                    //a custom widget for each category
                    context: context,
                    title: category['title']!,
                    emoji: category['image']!,
                    onTap: () {
                      //logic when clicked
                    },
                  );
                }).toList(),
          ),
        ),
      ),
    );
  }

  //builder function to build custom widget
  Widget _buildCategoryCard({
    required BuildContext context,
    required String title,
    required String emoji,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      //detects clicks on category card and executes onTap
      onTap: onTap,
      child: Container(
        //card styling
        width: 150,
        height: 100,
        decoration: BoxDecoration(
          color: colorScheme.surfaceVariant,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: colorScheme.outline),
        ),
        child: Center(
          //centers content inside card
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, //centers vertically
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
