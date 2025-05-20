import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class AppTextStyles {
  static TextStyle getTextStyle({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.w400,
    Color color = Colors.black,
    TextDecoration? decoration,
  }) {
    return GoogleFonts.oxygen(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      decoration: decoration,
    );
  }

  static TextStyle get t14b400_FFF => getTextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteFFF,
      );

  static TextStyle get t16b400_FFF => getTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteFFF,
      );

  static TextStyle get t16b600_FFF => getTextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.whiteFFF,
  );

  static TextStyle get t16b700_FFF => getTextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.whiteFFF,
      );

  static TextStyle get t18b500_FFF => getTextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: AppColors.whiteFFF,
      );

  static TextStyle get t24b400_FFF => getTextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w400,
        color: AppColors.whiteFFF,
      );

  static TextStyle get t34b600_FFF => getTextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w600,
        color: AppColors.whiteFFF,
      );

  static TextStyle get t14b400_FFF_Poppings =>
      GoogleFonts.poppins(color: AppColors.whiteFFF, fontSize: 14, fontWeight: FontWeight.w400);
}
