import 'package:flutter/material.dart';
import 'package:prodoc/src/utils/color.dart';

class AppTheme {
  static AppBarTheme appBarTheme() {
    return AppBarTheme(
      centerTitle: true,
      backgroundColor: AppColors.blueColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
    );
  }
}
