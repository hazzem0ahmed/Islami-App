import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/text_styles.dart';

import '../../../core/styles/colors.dart';

class SebahTab extends StatefulWidget {
  const SebahTab({super.key});

  @override
  State<SebahTab> createState() => _SebahTabState();
}

class _SebahTabState extends State<SebahTab> with TickerProviderStateMixin {
  double _turns = 0.0;

  void _rotateImage() {
    setState(() {
      _turns += 1.0;
    });
  }

  late int _sebhaCounter;
  late List<String> _sebhaStrings;
  late int index;

  @override
  void initState() {
    super.initState();

    _sebhaCounter = 0;
    index = 0;
    _sebhaStrings = ['الله أكبر', 'الحمد لله', 'سبحان الله'];
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/sebha_bg.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.black, AppColors.black.withAlpha(50)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/Logo.png",
                    width: mediaQuery.width * 0.7,
                  ),
                ),
                SizedBox(height: 8),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/سَبِّحِ اسْمَ رَبِّكَ الأعلى.png",
                    width: mediaQuery.width * 0.7,
                  ),
                ),
                SizedBox(
                  height: 100,
                  child: Image.asset("assets/images/sebhabody2.png"),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      height: 350,
                      child: GestureDetector(
                        onTap: () {
                          _rotateImage();
                          _tasbeehIncrement();
                        },

                        child: AnimatedRotation(
                          turns: _turns,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.easeInOut,

                          child: Image.asset("assets/images/SebhaBody 1.png"),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          _sebhaStrings[index],
                          style: TextStyles.specialFont(),
                        ),
                        Text(
                          _sebhaCounter.toString(),
                          style: TextStyles.specialFont(),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppColors.black,
            foregroundColor: AppColors.gold,
            onPressed: _reset,
            icon: Icon(Icons.replay, size: 30),
            label: Text("Tasbeeh Reset", style: TextStyles.mediumLabel()),
          ),
        ),
      ),
    );
  }

  void _tasbeehIncrement() {
    setState(() {
      _sebhaCounter++;
      if (index == 0 && _sebhaCounter == 33) {
        index = 1;
      } else if (index == 1 && _sebhaCounter == 66) {
        index = 2;
      } else if (index == 2 && _sebhaCounter == 99) {
        index = 0;
        _sebhaCounter = 0;
      }
    });
  }

  _reset() {
    setState(() {
      index = 0;
      _sebhaCounter = 0;
    });
  }
}
