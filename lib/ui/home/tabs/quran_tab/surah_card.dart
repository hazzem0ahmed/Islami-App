import 'package:flutter/material.dart';
import 'package:islami_app/model/surah_dm.dart';
import 'package:islami_app/ui/surah_details.dart';

import '../../../../core/styles/colors.dart';
import '../../../../core/styles/text_styles.dart';

class SurahCard extends StatelessWidget {
  final SurahDM surah;

  const SurahCard({required this.surah, super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          SurahDetails.routeName,
          arguments: surah,
        );
      },
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Image.asset("assets/images/img_sur_number_frame.png", width: 72),
              Text(
                surah.surahNumber.toString(),
                style: TextStyles.smallLabel(textColor: AppColors.white),
              ),
            ],
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  surah.surahEn,
                  style: TextStyles.mediumLabel(textColor: AppColors.white),
                ),
                Text(
                  "${surah.ayatNumber} Verses",
                  style: TextStyles.mediumLabel(textColor: AppColors.white),
                ),
              ],
            ),
          ),
          Text(
            surah.surahAr,
            style: TextStyles.mediumLabel(textColor: AppColors.white),
          ),
        ],
      ),
    );
  }
}
