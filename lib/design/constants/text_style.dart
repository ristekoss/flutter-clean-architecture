import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:boilerplate/design/constants/colors.dart';

class AppTextStyle {
  static TextStyle small = GoogleFonts.poppins(
      textStyle: const TextStyle(
          height: 1.5,
          color: AppColors.black,
          fontSize: 12,
      )
  );

  static TextStyle extraSmall = GoogleFonts.poppins(
      textStyle: const TextStyle(
        height: 1.5,
        color: AppColors.grey100,
        fontSize: 10,
      )
  );

  static TextStyle title1 = GoogleFonts.poppins(
      textStyle: const TextStyle(
        height: 1.5,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 18,
      )
  );

  static TextStyle headline1 = GoogleFonts.poppins(
      textStyle: const TextStyle(
        height: 1.5,
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        fontSize: 24,
      )
  );

  static TextStyle regularSemiBold = GoogleFonts.poppins(
      textStyle: const TextStyle(
          height: 1.5,
          fontWeight: FontWeight.w500,
          color: Colors.white
      )
  );

  static TextStyle headline3 = GoogleFonts.poppins(
      textStyle: const TextStyle(
          height: 1.5,
          fontWeight: FontWeight.w500,
          fontSize: 16,
      )
  );

  static TextStyle appBar = GoogleFonts.poppins(
      textStyle: const TextStyle(
        height: 1.5,
        fontWeight: FontWeight.w600,
        fontSize: 18,
        color: AppColors.black
      )
  );
}