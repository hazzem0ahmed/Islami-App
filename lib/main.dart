import 'package:flutter/material.dart';
import 'package:islami_app/ui/hadeeth_details_screen.dart';
import 'package:islami_app/ui/home/home_screen.dart';
import 'package:islami_app/ui/intro_screen/intro_screen_details.dart';

import 'package:islami_app/ui/splash_screen.dart';
import 'package:islami_app/ui/surah_details.dart';


void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        SplashScreen.routeName:(BuildContext context) => SplashScreen(),
        HomeScreen.routeName:(BuildContext context) => HomeScreen(),
        SurahDetails.routeName:(BuildContext context) => SurahDetails(),
        HadeethDetailsScreen.routeName:(BuildContext context) => HadeethDetailsScreen(),
        IntroScreenDetails.routeName:(BuildContext context) => IntroScreenDetails(),

      },
      initialRoute: IntroScreenDetails.routeName,
    );
  }
}
