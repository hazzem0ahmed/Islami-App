import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/colors.dart';
import 'package:islami_app/core/styles/text_styles.dart';
import 'package:islami_app/model/surah_dm.dart';

class MostRecentCard extends StatelessWidget {
  final SurahDM surah;

  final Function(SurahDM) onSurahClick;

  const MostRecentCard({required this.surah,required this.onSurahClick, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onSurahClick(surah);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  surah.surahAr,
                  style: TextStyles.mediumLabel(textColor: AppColors.black),
                ),

                Text(
                  surah.surahEn,
                  style: TextStyles.mediumLabel(textColor: AppColors.black),
                ),

                Text(
                  "${surah.ayatNumber} Verses",
                  style: TextStyles.mediumLabel(textColor: AppColors.black),
                ),
              ],
            ),
            Image.asset("assets/images/img_most_recent.png"),
          ],
        ),
      ),
    );
  }
}
