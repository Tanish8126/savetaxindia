import 'package:flutter/material.dart';

import '../utils/constants/constants.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kPrimary,
    fontFamily: "Roboto",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    iconTheme: iconTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: kBlack),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    titleMedium: TextStyle(color: kWhite),
    bodyLarge: TextStyle(color: kWhite),
    bodyMedium: TextStyle(color: kWhite),
  );
}

IconThemeData iconTheme() {
  return const IconThemeData(color: kWhite);
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    backgroundColor: kBlack,
    elevation: 0,
    centerTitle: true,
    titleTextStyle: TextStyle(color: kWhite, fontSize: 18),
  );
}
