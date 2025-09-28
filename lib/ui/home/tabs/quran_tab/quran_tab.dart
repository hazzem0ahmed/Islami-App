import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/text_styles.dart';
import 'package:islami_app/model/surah_dm.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/surah_card.dart';
import 'package:islami_app/ui/surah_details.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/styles/colors.dart';
import 'most_recent_card.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<SurahDM> searchList = [];
  List<SurahDM> mostRecent = [];

  @override
  void initState() {
    _loadMostRecent();
    super.initState();
  }

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
                    onChanged: (String input) {
                      _searchInSurasList(input);
                    },
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
                Expanded(
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (searchList.isEmpty) {
                        return CustomScrollView(
                          slivers: [
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  "Most Recent",
                                  style: TextStyles.smallLabel(
                                    textColor: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            if (mostRecent.isNotEmpty)
                              SliverToBoxAdapter(
                                child: SizedBox(
                                  height: 180,
                                  child: ListView.separated(
                                    padding: EdgeInsets.all(16),
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder:
                                        (context, index) => MostRecentCard(
                                          surah: mostRecent[index],
                                          onSurahClick: onSurahClick,
                                        ),
                                    separatorBuilder:
                                        (context, index) => SizedBox(width: 8),
                                    itemCount: mostRecent.length,
                                  ),
                                ),
                              ),
                            SliverToBoxAdapter(child: SizedBox(height: 16)),
                            SliverToBoxAdapter(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                ),
                                child: Text(
                                  "Surahs List",
                                  style: TextStyles.smallLabel(
                                    textColor: AppColors.white,
                                  ),
                                ),
                              ),
                            ),
                            SliverToBoxAdapter(child: SizedBox(height: 16)),
                            SliverList.separated(
                              itemBuilder:
                                  (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 8,
                                    ),
                                    child: SurahCard(
                                      surah: SurahDM.surahsList[index],
                                      onSurahClick: onSurahClick,
                                    ),
                                  ),
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
                          ],
                        );
                      } else {
                        return ListView.separated(
                          padding: EdgeInsets.all(16),
                          itemBuilder:
                              (context, index) =>
                                  SurahCard(
                                      surah: searchList[index],
                                    onSurahClick: onSurahClick,

                                  ),
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
                          itemCount: searchList.length,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _searchInSurasList(String input) {
    if (input.isEmpty) {
      searchList = [];
    } else {
      searchList =
          SurahDM.surahsList
              .where((sura) => sura.surahAr.contains(input))
              .toList();
      if (searchList.isEmpty) {
        searchList =
            SurahDM.surahsList
                .where(
                  (sura) =>
                      sura.surahEn.toLowerCase().contains(input.toLowerCase()),
                )
                .toList();
      }
    }
    setState(() {});
  }

  Future<void> _loadMostRecent() async {
    mostRecent = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    var mostRecentList = sharedPreferences.getStringList("mostRecent") ?? [];

    for (String surahNumber in mostRecentList) {
      var number = int.parse(surahNumber);
      mostRecent.add(SurahDM.surahsList[number - 1]);
    }
    setState(() {});
  }

  Future<void> storeSurah(int surahNumber) async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var mostRecent = sharedPreferences.getStringList("mostRecent")??[];
    if(mostRecent.contains(surahNumber.toString())){
      mostRecent.removeWhere((e) => e == surahNumber.toString());
    }
    mostRecent = [surahNumber.toString(), ...mostRecent];
    sharedPreferences.setStringList("mostRecent", mostRecent);
    _loadMostRecent();

  }

  onSurahClick(SurahDM surah) {
    storeSurah(surah.surahNumber);
    Navigator.pushNamed(context, SurahDetails.routeName,arguments: surah);
  }
}
