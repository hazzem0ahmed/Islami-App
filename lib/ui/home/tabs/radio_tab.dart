import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/colors.dart';
import 'package:islami_app/core/styles/text_styles.dart';
import 'package:islami_app/ui/home/tabs/radio/radio_tab2.dart';
import 'package:islami_app/ui/home/tabs/radio/reciters_tab.dart';

class RadioTab extends StatefulWidget {
  const RadioTab({super.key});

  @override
  State<RadioTab> createState() => _RadioTabState();
}

class _RadioTabState extends State<RadioTab>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 0;
  static const List<Tab> myTabs = <Tab>[Tab(text: 'LEFT'), Tab(text: 'RIGHT')];

  List<Widget> radioTabs = [RadioTab(), RecitersTab()];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: radioTabs.length);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var mediaQuery = MediaQuery.sizeOf(context);

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/radio_bg.png"),
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
            child: Center(
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/Logo.png",
                    width: mediaQuery.width * 0.8,
                    height: mediaQuery.height * 0.2,
                  ),
                  TabBar(
                    controller: tabController,
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    indicator: BoxDecoration(),
                    dividerHeight: 0,
                    tabs: [
                      createTab("Radio", selectedIndex == 0),
                      createTab("Reciters", selectedIndex == 1),
                    ],
                  ),
                  SizedBox(height: mediaQuery.height*0.02,),
                  Expanded(
                    child: TabBarView(
                        controller: tabController,
                        children: [
                          RadioTabDesign(),
                          RecitersTab(),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget createTab(String title, bool isSelected) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: isSelected ? AppColors.gold : AppColors.black.withAlpha(99),
      ),
      child: Text(
        title,
        style: TextStyles.largeLabel(
          textColor: isSelected ? AppColors.black : AppColors.white,
        ),
      ),
    );
  }
}
