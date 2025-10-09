import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/colors.dart';
import 'package:islami_app/core/styles/text_styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../home/home_screen.dart';
import '../widget/intro_screen.dart';

class IntroScreenDetails extends StatefulWidget {
  static const String routeName = "/IntroScreenDetails";

  const IntroScreenDetails({super.key});

  @override
  State<IntroScreenDetails> createState() => _IntroScreenDetailsState();
}

class _IntroScreenDetailsState extends State<IntroScreenDetails> {
  final PageController _pageController = PageController();
  bool inLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          PageView(
            onPageChanged: (index){
              setState(() {
                inLastPage = (index == 4);
              });
            },
            controller: _pageController,
            children: [
              IntroScreenWidget(
                image: "assets/images/marhban.png",
                title: "Welcome To Islami App",
                content: "",
              ),
              IntroScreenWidget(
                image: "assets/images/intro2.png",
                title: "Welcome To Islami",
                content: """We are Very Excited to Have you in Our 
                            Community""",
              ),
              IntroScreenWidget(
                image: "assets/images/intro3.png",
                title: "Reading The Quran",
                content: "Read,and your Lord is The Most Generous",
              ),
              IntroScreenWidget(
                image: "assets/images/intro4.png",
                title: "Bearish",
                content: "Praise the name Of your Lord,the Most high",
              ),
              IntroScreenWidget(
                image: "assets/images/intro6.png",
                title: "Holy Quran Radio",
                content: """            You can Listen to the holy Quran 
  through the Application for Free And Easily""",
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.bottomLeft,
                  child: TextButton(
                    onPressed: () {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    child: Text("Back", style: TextStyles.smallLabel()),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Expanded(
                      child: SmoothPageIndicator(
                        effect: ExpandingDotsEffect(),
                        controller: _pageController,
                        count: 5,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child:
                  inLastPage
                          ? TextButton(
                            onPressed: () {
                              confirmIsFirst(context);
                            },
                            child: Text(
                              "Finish",
                              style: TextStyles.smallLabel(),
                            ),
                          )
                          : TextButton(
                            onPressed: () {
                              _pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeIn,
                              );
                            },
                            child: Text("Next", style: TextStyles.smallLabel()),
                          ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Future<void> confirmIsFirst(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("First", true);
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);

  }
}
