import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final backgroundColor = theme.primaryColor;
    final textColor = theme.colorScheme.onPrimary;
    final borderColor = theme.colorScheme.onPrimary.withOpacity(0.2);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView( //scrollable for smallscreens
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Greeting Box
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Hello,", style: GoogleFonts.poppins(color: textColor)),
                    const SizedBox(height: 4),
                    Text(
                      "FULL NAME",
                      style: GoogleFonts.poppins(
                        color: textColor,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),

              // Menu Items - calls a custom widget method thta builds each row item 
              _buildMenuItem(Icons.person_outline, "Update Profile", textColor, backgroundColor, borderColor),
              _buildMenuItem(Icons.history, "Order History", textColor, backgroundColor, borderColor),
              _buildMenuItem(Icons.favorite_border, "My Wishlist", textColor, backgroundColor, borderColor),
              _buildMenuItem(Icons.location_on_outlined, "Manage Address", textColor, backgroundColor, borderColor),
              _buildMenuItem(Icons.logout, "Logout", textColor, backgroundColor, null),
            ],
          ),
        ),
      ),
    );
  }
  //this is the method
  Widget _buildMenuItem(IconData icon, String title, Color textColor, Color bgColor, Color? borderColor) {
    return Container(
      width: double.infinity, //full width
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: borderColor != null
            ? Border(
                bottom: BorderSide(color: borderColor, width: 0.5),
              )
            : null,
      ),
      child: Row(
        children: [
          Icon(icon, color: textColor),
          const SizedBox(width: 16),
          Text(
            title.toUpperCase(),
            style: GoogleFonts.poppins(
              color: textColor,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
