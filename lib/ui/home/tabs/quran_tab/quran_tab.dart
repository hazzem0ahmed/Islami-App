import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/text_styles.dart';
import 'package:islami_app/model/surah_dm.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/surah_card.dart';

import '../../../../core/styles/colors.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black.withAlpha(50), AppColors.black],
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
                    width: mediaQuery.width * 0.65,
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                      filled: true,
                      fillColor: AppColors.black.withAlpha(60),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: AppColors.gold),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      prefixIcon: ImageIcon(
                        color: AppColors.gold,
                        AssetImage("assets/images/quran_icon.png"),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Most Recent",
                    style: TextStyles.smallLabel(textColor: AppColors.white),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    "Surahs List",
                    style: TextStyles.smallLabel(textColor: AppColors.white),
                  ),
                ),
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.all(16),
                    itemBuilder:
                        (context, index) =>
                            SurahCard(surah: SurahDM.surahsList[index]),
                    separatorBuilder:
                        (_, _) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Divider(
                            thickness: 2.5,
                            indent: 56,
                            endIndent: 56,
                            color: AppColors.white,
                          ),
                        ),
                    itemCount: SurahDM.surahsList.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
