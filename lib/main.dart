import 'package:debotos_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:debotos_app/config/app_theme.dart';

void main() {
  // For splash screen
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Boot app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Debotos App',
      debugShowCheckedModeBanner: false,
      theme: customLightTheme(),
      darkTheme: customDarkTheme(),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
