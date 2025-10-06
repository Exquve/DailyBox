import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ModernTheme {
  // Modern iOS 16+ Color Palette
  static const Color primaryBlue = Color(0xFF007AFF);
  static const Color primaryPurple = Color(0xFF5856D6);
  static const Color primaryTeal = Color(0xFF32D74B);
  static const Color primaryOrange = Color(0xFFFF9500);
  static const Color primaryPink = Color(0xFFFF2D92);
  static const Color primaryRed = Color(0xFFFF3B30);
  
  // Gradient colors for glassmorphism
  static const List<Color> lightGradient = [
    Color(0xFFF2F2F7),
    Color(0xFFFFFFFF),
  ];
  
  static const List<Color> darkGradient = [
    Color(0xFF000000),
    Color(0xFF1C1C1E),
  ];
  
  // Glass colors
  static const Color lightGlass = Color(0x80FFFFFF);
  static const Color darkGlass = Color(0x40000000);
  static const Color lightGlassBorder = Color(0x40FFFFFF);
  static const Color darkGlassBorder = Color(0x40FFFFFF);
  
  // Text colors with iOS 16 style
  static const Color lightPrimaryText = Color(0xFF000000);
  static const Color darkPrimaryText = Color(0xFFFFFFFF);
  static const Color lightSecondaryText = Color(0xFF8E8E93);
  static const Color darkSecondaryText = Color(0xFF8E8E93);
  static const Color lightTertiaryText = Color(0xFF3C3C43);
  static const Color darkTertiaryText = Color(0xFFEBEBF5);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    fontFamily: 'SF Pro Display',
    colorScheme: const ColorScheme.light(
      primary: primaryBlue,
      secondary: primaryPurple,
      tertiary: primaryTeal,
      surface: Color(0xFFF2F2F7),
      background: Color(0xFFF2F2F7),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: lightPrimaryText,
      onBackground: lightPrimaryText,
      outline: Color(0x29000000),
    ),
    scaffoldBackgroundColor: const Color(0xFFF2F2F7),
    
    // Modern iOS app bar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: lightPrimaryText,
        fontSize: 34,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.37,
      ),
      iconTheme: IconThemeData(color: primaryBlue, size: 28),
    ),
    
    // Glassmorphism cards
    cardTheme: CardThemeData(
      elevation: 0,
      color: lightGlass,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: lightGlassBorder,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    
    // Modern iOS buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: const Size(0, 50),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.41,
        ),
      ),
    ),
    
    // Text buttons
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryBlue,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.41,
        ),
      ),
    ),
    
    // Outlined buttons
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryBlue,
        side: const BorderSide(color: primaryBlue, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: const Size(0, 50),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.41,
        ),
      ),
    ),
    
    // iOS Typography
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: lightPrimaryText,
        letterSpacing: -0.25,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: lightPrimaryText,
        letterSpacing: 0,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: lightPrimaryText,
        letterSpacing: 0,
      ),
      headlineLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: lightPrimaryText,
        letterSpacing: 0.37,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: lightPrimaryText,
        letterSpacing: 0.36,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: lightPrimaryText,
        letterSpacing: 0.35,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: lightPrimaryText,
        letterSpacing: 0.15,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: lightPrimaryText,
        letterSpacing: -0.41,
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: lightPrimaryText,
        letterSpacing: -0.08,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: lightPrimaryText,
        letterSpacing: -0.41,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: lightSecondaryText,
        letterSpacing: -0.24,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: lightSecondaryText,
        letterSpacing: -0.08,
      ),
      labelLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: lightPrimaryText,
        letterSpacing: -0.41,
      ),
      labelMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: lightPrimaryText,
        letterSpacing: -0.24,
      ),
      labelSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: lightSecondaryText,
        letterSpacing: -0.08,
      ),
    ),
    
    // Modern input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightGlass,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: lightGlassBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: lightGlassBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primaryBlue, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: const TextStyle(
        color: lightSecondaryText,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.41,
      ),
    ),
    
    // Modern floating action button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryBlue,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: CircleBorder(),
    ),
    
    // Modern bottom navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: lightGlass,
      selectedItemColor: primaryBlue,
      unselectedItemColor: lightSecondaryText,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    
    // Modern icon theme
    iconTheme: const IconThemeData(
      color: primaryBlue,
      size: 24,
    ),
    
    // Modern divider
    dividerTheme: const DividerThemeData(
      color: Color(0x29000000),
      thickness: 0.5,
      space: 1,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    fontFamily: 'SF Pro Display',
    colorScheme: const ColorScheme.dark(
      primary: primaryBlue,
      secondary: primaryPurple,
      tertiary: primaryTeal,
      surface: Color(0xFF000000),
      background: Color(0xFF000000),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: darkPrimaryText,
      onBackground: darkPrimaryText,
      outline: Color(0x29FFFFFF),
    ),
    scaffoldBackgroundColor: const Color(0xFF000000),
    
    // Dark mode app bar
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      centerTitle: false,
      titleTextStyle: TextStyle(
        color: darkPrimaryText,
        fontSize: 34,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.37,
      ),
      iconTheme: IconThemeData(color: primaryBlue, size: 28),
    ),
    
    // Dark glassmorphism cards
    cardTheme: CardThemeData(
      elevation: 0,
      color: darkGlass,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(
          color: darkGlassBorder,
          width: 1,
        ),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    ),
    
    // Dark mode buttons
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryBlue,
        foregroundColor: Colors.white,
        elevation: 0,
        shadowColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: const Size(0, 50),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.41,
        ),
      ),
    ),
    
    // Dark text buttons
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: primaryBlue,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.41,
        ),
      ),
    ),
    
    // Dark outlined buttons
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: primaryBlue,
        side: const BorderSide(color: primaryBlue, width: 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        minimumSize: const Size(0, 50),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        textStyle: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.41,
        ),
      ),
    ),
    
    // Dark mode typography
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 57,
        fontWeight: FontWeight.w400,
        color: darkPrimaryText,
        letterSpacing: -0.25,
      ),
      displayMedium: TextStyle(
        fontSize: 45,
        fontWeight: FontWeight.w400,
        color: darkPrimaryText,
        letterSpacing: 0,
      ),
      displaySmall: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w400,
        color: darkPrimaryText,
        letterSpacing: 0,
      ),
      headlineLarge: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: darkPrimaryText,
        letterSpacing: 0.37,
      ),
      headlineMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w700,
        color: darkPrimaryText,
        letterSpacing: 0.36,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: darkPrimaryText,
        letterSpacing: 0.35,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: darkPrimaryText,
        letterSpacing: 0.15,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: darkPrimaryText,
        letterSpacing: -0.41,
      ),
      titleSmall: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: darkPrimaryText,
        letterSpacing: -0.08,
      ),
      bodyLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w400,
        color: darkPrimaryText,
        letterSpacing: -0.41,
      ),
      bodyMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w400,
        color: darkSecondaryText,
        letterSpacing: -0.24,
      ),
      bodySmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w400,
        color: darkSecondaryText,
        letterSpacing: -0.08,
      ),
      labelLarge: TextStyle(
        fontSize: 17,
        fontWeight: FontWeight.w600,
        color: darkPrimaryText,
        letterSpacing: -0.41,
      ),
      labelMedium: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: darkPrimaryText,
        letterSpacing: -0.24,
      ),
      labelSmall: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: darkSecondaryText,
        letterSpacing: -0.08,
      ),
    ),
    
    // Dark mode input fields
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: darkGlass,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: darkGlassBorder),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: darkGlassBorder),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: const BorderSide(color: primaryBlue, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      hintStyle: const TextStyle(
        color: darkSecondaryText,
        fontSize: 17,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.41,
      ),
    ),
    
    // Dark floating action button
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: primaryBlue,
      foregroundColor: Colors.white,
      elevation: 0,
      shape: CircleBorder(),
    ),
    
    // Dark bottom navigation
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: darkGlass,
      selectedItemColor: primaryBlue,
      unselectedItemColor: darkSecondaryText,
      type: BottomNavigationBarType.fixed,
      elevation: 0,
    ),
    
    // Dark icon theme
    iconTheme: const IconThemeData(
      color: primaryBlue,
      size: 24,
    ),
    
    // Dark divider
    dividerTheme: const DividerThemeData(
      color: Color(0x29FFFFFF),
      thickness: 0.5,
      space: 1,
    ),
  );
}