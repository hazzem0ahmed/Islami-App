import 'package:flutter/material.dart';
import 'package:islami_app/core/styles/text_styles.dart';

import '../../core/styles/colors.dart';

class RadioCard extends StatelessWidget {
  final String label;
  final IconData icon;

  const RadioCard({this.icon = Icons.play_arrow_rounded, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Mosque-02.png"),
            alignment: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.circular(20),
          color: AppColors.gold,
        ),
        alignment: Alignment.center,
        width: double.infinity,
        height: size.height * 0.15,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Align(
              alignment: Alignment.center,
              child: Text(
                "Radio $label",
                style: TextStyles.largeLabel(textColor: AppColors.black),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Icon(icon, color: Colors.black, size: 50)),
                SizedBox(width: size.width*0.02,),
                Icon(Icons.volume_up, color: Colors.black, size: 50),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
