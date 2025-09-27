import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/colors.dart';
import 'package:islami_app/model/surah_dm.dart';
import 'package:islami_app/ui/home/tabs/bottom_navigation_decoration.dart';
import 'package:islami_app/ui/home/tabs/hadeth_tab.dart';
import 'package:islami_app/ui/home/tabs/quran_tab/quran_tab.dart';
import 'package:islami_app/ui/home/tabs/radio_tab.dart';
import 'package:islami_app/ui/home/tabs/sebah_tab.dart';
import 'package:islami_app/ui/home/tabs/time-tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/HomeScreen";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    SurahDM.getSurahsList();
  }

  List<Widget> tabs = [
    QuranTab(),
    HadethTab(),
    SebahTab(),
    RadioTab(),
    TimeTab(),
  ];

  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: tabs[isSelected],
      backgroundColor: AppColors.black,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          isSelected = index;
          setState(() {});
        },
        currentIndex: isSelected,
        backgroundColor: AppColors.gold,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.white,
        unselectedItemColor: AppColors.black,
        items: [
          BottomNavigationBarItem(
            icon: GetBottomNavigationBarItem(
              isSelected == 0,
              "assets/images/quran_icon.png",
            ),
            label: "Quran",
          ),
          BottomNavigationBarItem(
            icon: GetBottomNavigationBarItem(
              isSelected == 1,
              "assets/images/hadeth_icon.png",
            ),
            label: "Hadeth",
          ),
          BottomNavigationBarItem(
            icon: GetBottomNavigationBarItem(
              isSelected == 2,
              "assets/images/sebha_icon.png",
            ),
            label: "Sebha",
          ),
          BottomNavigationBarItem(
            icon: GetBottomNavigationBarItem(
              isSelected == 3,
              "assets/images/radio_icon.png",
            ),
            label: "Radio",
          ),
          BottomNavigationBarItem(
            icon: GetBottomNavigationBarItem(
              isSelected == 4,
              "assets/images/time_icon.png",
            ),
            label: "Time",
          ),
        ],
      ),
    );
  }
}
