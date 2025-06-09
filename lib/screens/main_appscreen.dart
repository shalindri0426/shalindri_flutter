import 'package:flutter/material.dart';
import 'package:luxe_living/screens/cart_screen.dart';
import 'package:luxe_living/screens/category_screen.dart';
import 'package:luxe_living/screens/home_screen.dart';
import 'package:luxe_living/screens/profile_screen.dart';

class MainAppscreen extends StatefulWidget {
  //UI will chnage based on user interaction - botton nav bar selection
  const MainAppscreen({super.key});

  @override
  //creates the mutable state
  State<MainAppscreen> createState() => _MainAppscreenState();
}

class _MainAppscreenState extends State<MainAppscreen> {
  //tracks which bottom nav item is selected (0=home, 1= category, 2= profile)
  int selectedIndex = 0;

  final List<Widget> pages = [
    //screens that are linked to the bottom navigation
    const HomeScreen(),
    const CategoryScreen(),
    const Text("my wishlist"),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    //gets the themedata and currect colourscheme according to thelight/drk mode
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      //is the bsic layout of the screen
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        backgroundColor: theme.appBarTheme.backgroundColor,
        elevation: 0, //gives a flat appearance
        title: Image.asset(
          //logo changes accoring tothe theme
          Theme.of(context).brightness == Brightness.dark
              ? "assets/images/logo.png"
              : "assets/images/logoWhite.png",
          height: 50,
        ),
        //cart icon
        actions: [
          Stack(
            clipBehavior:
                Clip.none, //allows to overflow outside the stack without being cut
            children: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: colorScheme.onPrimary),
                onPressed: () {
                  Navigator.push(
                    //moves to the cart screen page
                    context,
                    MaterialPageRoute(builder: (context) => (CartScreen())),
                  );
                },
              ),
              Positioned(
                //places the no. of products in the top right corner
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
      body:
          pages[selectedIndex], //displays the screen corresponding to the selected index/tab
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex, //tracks the active screen
        onTap: (index) {
          //triggers setstate() to udatethe UI
          setState(() {
            selectedIndex = index;
          });
        },
        elevation: 0, //no shadow under nav bar
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.secondary,
        type: BottomNavigationBarType.fixed, //nav bar is fixed
        items: const [
          //nav bar icons with labels
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Wishlist",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
