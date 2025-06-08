import 'package:flutter/material.dart';
import 'package:luxe_living/screens/home_screen.dart';
import 'package:luxe_living/screens/login_screen.dart';

class MainAppscreen extends StatefulWidget {
  const MainAppscreen({super.key});

  @override
  State<MainAppscreen> createState() => _MainAppscreenState();
}

class _MainAppscreenState extends State<MainAppscreen> {
  int selectedIndex = 0;

  final List<Widget> pages = [
    const HomeScreen(),
    const Scaffold(body: Center(child: Text('Categories Screen Placeholder'))),
    const LoginPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0,
        title: Image.asset("assets/images/logo.png", height: 40),
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              IconButton(
                icon: const Icon(Icons.shopping_cart, color: Colors.black),
                onPressed: () {
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
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.pink,
        selectedItemColor: Colors.yellow,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
