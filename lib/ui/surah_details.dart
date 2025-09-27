import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/styles/text_styles.dart';
import 'package:islami_app/model/surah_dm.dart';

import '../core/styles/colors.dart';

class SurahDetails extends StatefulWidget {
  static const String routeName = "/SurahDetailsScreen";

  SurahDetails({super.key});

  @override
  State<SurahDetails> createState() => _SurahDetailsState();
}

class _SurahDetailsState extends State<SurahDetails> {
  late SurahDM surah;

  String? content;

  @override
  Widget build(BuildContext context) {
    surah = ModalRoute.of(context)?.settings.arguments as SurahDM;
    if (content == null) {
      readSuraDetails(surah.surahNumber);
    }

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.gold,
        centerTitle: true,
        title: Text("${surah.surahEn}", style: TextStyles.mediumLabel()),
      ),
      body: Center(
        child:
            content == null
                ? CircularProgressIndicator()
                : Directionality(
                  textDirection: TextDirection.rtl,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset("assets/images/img_right_corner.png"),
                            Expanded(
                              child: Text(
                                surah.surahAr,
                                style: TextStyles.mediumLabel(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Image.asset("assets/images/img_left_corner.png"),
                          ],
                        ),
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            content ?? "",
                            style: TextStyles.largeBody(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
      ),
    );
  }

  Future<void> readSuraDetails(int suraNumber) async {
    String suraContent = await rootBundle.loadString(
      "assets/files/$suraNumber.txt",
    );
    List<String> suraAyas = suraContent.trim().split("\n");
    suraContent = "";
    for (int i = 0; i < suraAyas.length; i++) {
      suraContent = "$suraContent[${i + 1}] ${suraAyas[i].trim()} ";
    }
    content = suraContent;
    setState(() {});
  }
}
