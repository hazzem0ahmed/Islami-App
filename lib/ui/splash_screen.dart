import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/colors.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/intro_screen/intro_screen_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? firstOpen;

  @override
  void initState() {
    super.initState();
    isFirst();

    Future.delayed(Duration(seconds: 3), () {
      String initialRoute =
          firstOpen == null
              ? IntroScreenDetails.routeName
              : HomeScreen.routeName;
      Navigator.pushReplacementNamed(context, initialRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Center(
            child: Image.asset(
              "assets/images/islami_logo.png",
              width: mediaQuery.width * 0.4,
            ),
          ).zoomIn(duration: Duration(seconds: 2)),
          Positioned(
            bottom: 32,
            child: Image.asset(
              "assets/images/islami_supervised.png",
              width: mediaQuery.width * 0.6,
            ).zoomIn(duration: Duration(seconds: 2)),
          ),
        ],
      ),
    );
  }

  Future<void> isFirst() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    bool? first = prefs.getBool("First");
    firstOpen = first;
  }
}
