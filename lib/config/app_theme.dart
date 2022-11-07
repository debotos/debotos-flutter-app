import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

var baseFontFamily = GoogleFonts.montserrat().fontFamily;

TextTheme customTextTheme(ThemeMode mode, TextTheme base) {
  bool isDark = mode == ThemeMode.dark;

  return base.copyWith(
    headline1: base.headline1?.copyWith(
      color: Colors.green,
      fontFamily: baseFontFamily,
    ),
    headline3: base.headline1?.copyWith(
      color: Colors.grey,
      fontFamily: baseFontFamily,
    ),
    headline4: base.headline1?.copyWith(
      color: Colors.white,
      fontFamily: baseFontFamily,
    ),
    headline6: base.headline6?.copyWith(color: Colors.orange),
    caption: base.caption?.copyWith(
      color: const Color(0xFFCCC5AF),
      fontFamily: baseFontFamily,
    ),
    bodyText1: base.bodyText1?.copyWith(
      color: isDark ? const Color.fromARGB(255, 202, 199, 199) : Colors.brown,
      fontFamily: baseFontFamily,
    ),
    bodyText2: base.bodyText2?.copyWith(
      color: isDark
          ? const Color.fromARGB(255, 212, 209, 209)
          : const Color.fromARGB(255, 88, 88, 86),
      fontFamily: baseFontFamily,
      fontWeight: FontWeight.w600,
    ),
  );
}

ThemeData customLightTheme() {
  final ThemeData lightTheme = ThemeData.light();
  return lightTheme.copyWith(
    textTheme: customTextTheme(ThemeMode.light, lightTheme.textTheme),
    primaryColor: const Color(0xffce107c),
    indicatorColor: const Color(0xFF807A6B),
    scaffoldBackgroundColor: const Color(0xFFF5F5F5),
    primaryIconTheme: lightTheme.primaryIconTheme.copyWith(
      color: Colors.white,
      size: 20,
    ),
    iconTheme: lightTheme.iconTheme.copyWith(
      color: Colors.white,
    ),
    backgroundColor: Colors.white,
    tabBarTheme: lightTheme.tabBarTheme.copyWith(
      labelColor: const Color(0xffce107c),
      unselectedLabelColor: Colors.grey,
    ),
    buttonTheme: lightTheme.buttonTheme.copyWith(buttonColor: Colors.red),
    errorColor: Colors.red,
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFFFF8E1)),
  );
}

ThemeData customDarkTheme() {
  final ThemeData darkTheme = ThemeData.dark();
  return darkTheme.copyWith(
    textTheme: customTextTheme(
      ThemeMode.dark,
      darkTheme.textTheme,
    ), // ThemeData.dark().textTheme.apply(fontFamily: baseFontFamily)
    primaryColor: Colors.black38,
    indicatorColor: const Color(0xFF807A6B),
    primaryIconTheme: darkTheme.primaryIconTheme.copyWith(
      color: Colors.green,
      size: 20,
    ),
    colorScheme:
        ColorScheme.fromSwatch().copyWith(secondary: const Color(0xFFFFF8E1)),
  );
}
