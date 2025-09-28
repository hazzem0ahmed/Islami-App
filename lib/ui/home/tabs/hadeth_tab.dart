import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/styles/colors.dart';
import 'package:islami_app/model/hadeeth_dm.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islami_app/ui/hadeeth_details_screen.dart';

import '../../../core/styles/text_styles.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadeethDM> ahadeeth = [];

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/hadith_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black.withAlpha(70), AppColors.black],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/Logo.png",
                    width: mediaQuery.width * 0.7,
                  ),
                ),
                Expanded(
                  child: CarouselSlider(
                    options: CarouselOptions(
                      height: double.infinity,
                      viewportFraction: 0.75,
                      enableInfiniteScroll: true,
                      enlargeCenterPage: true,
                    ),
                    items:
                        ahadeeth
                            .map(
                              (hadeth) => InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    HadeethDetailsScreen.routeName,
                                    arguments: hadeth,
                                  );
                                },
                                child: Container(
                                  width: double.infinity,

                                  decoration: BoxDecoration(
                                    color: AppColors.gold,
                                    borderRadius: BorderRadius.circular(24),
                                    image: DecorationImage(
                                      image: AssetImage(
                                        "assets/images/HadithCardBackGround 1.png",
                                      ),
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Row(
                                          children: [
                                            ImageIcon(
                                              AssetImage(
                                                "assets/images/img_left_corner.png",
                                              ),
                                              size: 64,
                                              color: AppColors.black,
                                            ),
                                            Expanded(
                                              child: Text(
                                                hadeth.title,
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            ImageIcon(
                                              AssetImage(
                                                "assets/images/img_right_corner.png",
                                              ),
                                              size: 64,
                                              color: AppColors.black,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                            hadeth.content,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Image.asset(
                                        "assets/images/img_bottom_decoration.png",
                                        color: AppColors.black,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _loadAhadeeth() async {
    var content = await rootBundle.loadString("assets/files/ahadeeth.txt");

    var ahadeethString = content.trim().split("#");

    for (String hadeethString in ahadeethString) {
      var hadeethLines = hadeethString.trim().split("\n");
      String title = hadeethLines[0];

      hadeethLines = hadeethLines.sublist(1);
      String content = hadeethLines.join(" ");
      ahadeeth.add(HadeethDM(title, content));
    }
  }
}
