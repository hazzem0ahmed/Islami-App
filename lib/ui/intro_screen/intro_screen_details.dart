import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/colors.dart';
import 'package:islami_app/core/styles/text_styles.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../widget/intro_screen.dart';

class IntroScreenDetails extends StatefulWidget {
  static const String routeName = "/IntroScreenDetails";

  const IntroScreenDetails({super.key});

  @override
  State<IntroScreenDetails> createState() => _IntroScreenDetailsState();
}

class _IntroScreenDetailsState extends State<IntroScreenDetails> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          PageView(
            controller: controller,
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
              Column(
                children: [
                  IntroScreenWidget(
                    image: "assets/images/intro6.png",
                    title: "Holy Quran Radio",
                    content: """            You can Listen to the holy Quran 
                              through the Application for Free And Easily""",
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
                            onPressed: () {},
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
                                controller: controller,
                                count: 5,
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {},
                            child: Text("Finish", style: TextStyles.smallLabel()),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                    onPressed: () {},
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
                        controller: controller,
                        count: 5,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {},
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
}
