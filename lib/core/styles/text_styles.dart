import 'package:flutter/material.dart';
import 'colors.dart';


abstract class TextStyles{

  static TextStyle specialFont({Color textColor = AppColors.white}){
    return TextStyle(
        fontSize: 40,
        color: textColor,
        fontWeight: FontWeight.w900,
        fontFamily:"jannah"
    );
  }

  static TextStyle largeTitle({Color textColor = AppColors.gold}){
   return TextStyle(
    fontSize: 24,
     color: textColor,
     fontWeight: FontWeight.w900,
     fontFamily:"jannah"
   );
  }

  static TextStyle mediumTitle({Color textColor = AppColors.gold}){
    return TextStyle(
        fontSize: 22,
        color: textColor,
        fontWeight: FontWeight.w900,
        fontFamily:"jannah"
    );
  }

  static TextStyle smallTitle({Color textColor = AppColors.gold}){
    return TextStyle(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w900,
        fontFamily:"jannah"
    );
  }

  static TextStyle largeLabel({Color textColor = AppColors.gold}){
    return TextStyle(
        fontSize: 22,
        color: textColor,
        fontWeight: FontWeight.w900,
        fontFamily:"jannah"
    );
  }

  static TextStyle mediumLabel({Color textColor = AppColors.gold}){
    return TextStyle(
        fontSize: 20,
        color: textColor,
        fontWeight: FontWeight.w900,
        fontFamily:"jannah"
    );
  }

  static TextStyle smallLabel({Color textColor = AppColors.gold}){
    return TextStyle(
        fontSize: 18,
        color: textColor,
        fontWeight: FontWeight.w900,
        fontFamily:"jannah"
    );
  }

  static TextStyle largeBody({Color textColor = AppColors.gold}){
    return TextStyle(
        fontSize: 16,
        color: textColor,
        fontWeight: FontWeight.w600,
        fontFamily:"jannah"
    );
  }

  static TextStyle mediumBody({Color textColor = AppColors.gold}){
    return TextStyle(
        fontSize: 14,
        color: textColor,
        fontWeight: FontWeight.w600,
        fontFamily:"jannah"
    );
  }

  static TextStyle smallBody({Color textColor = AppColors.gold}){
    return TextStyle(
        fontSize: 12,
        color: textColor,
        fontWeight: FontWeight.w600,
        fontFamily:"jannah"
    );
  }
}

//jannah