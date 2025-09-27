import 'package:flutter/material.dart';

import '../../../core/styles/colors.dart';

class GetBottomNavigationBarItem extends StatelessWidget {
final bool selected;
final String image;

  const GetBottomNavigationBarItem( this.selected, this.image,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
      decoration:BoxDecoration(
        color: AppColors.black.withAlpha(selected?70:0),
        borderRadius: BorderRadius.circular(100),
      ),
      child: ImageIcon(AssetImage(image)),
    );
  }
}
