import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/colors.dart';
import 'home/home_screen.dart';


class SplashScreen extends StatefulWidget {
  static const String routeName = "/SplashScreen";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
          () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  HomeScreen()),
      ),
    );
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
}

