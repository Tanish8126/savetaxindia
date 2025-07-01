// This file defines the app's theme, including colors, text styles, and input decorations.
import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';

// Returns the main ThemeData for the app
ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kWhite, // Set background color for all screens
    fontFamily: "Roboto", // Set default font
    appBarTheme: appBarTheme(), // AppBar styling
    textTheme: textTheme(), // Text styling
    iconTheme: iconTheme(), // Icon styling
    inputDecorationTheme: inputDecorationTheme(), // Input field styling
    visualDensity: VisualDensity.adaptivePlatformDensity, // Platform density
  );
}

// Returns the input decoration theme for text fields
InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28), // Rounded corners
    borderSide: const BorderSide(color: kBlack), // Border color
    gapPadding: 10, // Padding between border and content
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      horizontal: 42,
      vertical: 20,
    ), // Padding inside input
    enabledBorder: outlineInputBorder, // Border when enabled
    focusedBorder: outlineInputBorder, // Border when focused
    border: outlineInputBorder, // Default border
  );
}

// Returns the text theme for the app
TextTheme textTheme() {
  return const TextTheme(
    titleMedium: TextStyle(color: kWhite), // Medium titles
    bodyLarge: TextStyle(color: kWhite), // Large body text
    bodyMedium: TextStyle(color: kWhite), // Medium body text
  );
}

// Returns the icon theme for the app
IconThemeData iconTheme() {
  return const IconThemeData(color: kWhite); // All icons are white
}

// Returns the AppBar theme for the app
AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: kWhite, // AppBar background
    elevation: 0, // No shadow
    centerTitle: true, // Center the title
    titleTextStyle: TextStyle(color: kPrimary, fontSize: 18), // Title style
  );
}
