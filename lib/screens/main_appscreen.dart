import 'package:flutter/material.dart';
import 'package:luxe_living/screens/cart_screen.dart';
import 'package:luxe_living/screens/category_screen.dart';
import 'package:luxe_living/screens/home_screen.dart';
import 'package:luxe_living/screens/profile_screen.dart';

class MainAppscreen extends StatefulWidget {
  const MainAppscreen({super.key});

  @override
  State<MainAppscreen> createState() => _MainAppscreenState();
}

class _MainAppscreenState extends State<MainAppscreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const CategoryScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0,
        title: Image.asset(
          Theme.of(context).brightness == Brightness.dark
              ? "assets/images/logo.png"
              : "assets/images/logoWhite.png",
          height: 50,
        ),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: colorScheme.onPrimary),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (CartScreen())),
                  );
                  // Add cart navigation logic here
                },
              ),
              Positioned(
                right: 3,
                top: -5,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: const Text(
                    "3",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        elevation: 0,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.secondary,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
