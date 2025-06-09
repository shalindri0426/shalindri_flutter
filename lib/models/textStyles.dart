import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyles {
  static final TextStyle h1 = GoogleFonts.poppins(
    fontSize: 40,
    color: Color(0xFF16282A),
    fontWeight: FontWeight.bold,
  );

  static final TextStyle h2 = GoogleFonts.poppins(
    fontSize: 20,
    color: Color(0xFF16282A).withAlpha(90),
    fontWeight: FontWeight.w400,
  );

  static final TextStyle para = GoogleFonts.poppins(
    fontSize: 12,
    color: Color(0xFF16282A),
    fontWeight: FontWeight.normal,
  );

  static final TextStyle button = GoogleFonts.poppins(
    fontSize: 16,
    color: Color(0xFF16282A),
    fontWeight: FontWeight.bold,
  );
}
