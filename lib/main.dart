import 'package:debotos_app/config/constants.dart';
import 'package:debotos_app/screens/introduction.dart';
import 'package:debotos_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:debotos_app/config/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  // For splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // For onBoarding/Welcome Screen
  var prefs = await SharedPreferences.getInstance();
  var welcomeScreenDisplayed = prefs.getBool(kWelcomeScreenDisplayed) ?? false;
  // Boot app
  runApp(MyApp(
    showWelcomeScreen: !welcomeScreenDisplayed,
  ));
}

class MyApp extends StatelessWidget {
  final bool showWelcomeScreen;
  const MyApp({super.key, required this.showWelcomeScreen});

  @override
  Widget build(BuildContext context) {
    print(showWelcomeScreen);
    return MaterialApp(
      title: 'Debotos App',
      debugShowCheckedModeBanner: false,
      theme: customLightTheme(),
      darkTheme: customDarkTheme(),
      themeMode: ThemeMode.system,
      home: showWelcomeScreen ? const OnBoardingPage() : const MainScreen(),
    );
  }
}
