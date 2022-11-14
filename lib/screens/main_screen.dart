import 'package:debotos_app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    FlutterNativeSplash.remove();
  }

  onPressed() async {
    var prefs = await SharedPreferences.getInstance();
    await prefs.remove(kWelcomeScreenDisplayed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ElevatedButton(
                onPressed: onPressed, child: const Text("Debotos"))));
  }
}
