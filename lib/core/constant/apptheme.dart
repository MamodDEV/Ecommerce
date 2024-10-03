import 'package:ecommerce/core/constant/color.dart';
import 'package:flutter/material.dart';

ThemeData themeEnglish = ThemeData(
    appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: AppColor.white),
        backgroundColor: AppColor.darkprimary,
        centerTitle: true,
        elevation: 5,
        shadowColor: AppColor.darkprimary,
        titleTextStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
        foregroundColor: AppColor.white),
    fontFamily: "NotoSans",
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      displayMedium: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w500,
          height: 2,
          fontSize: 16,
          color: AppColor.grey),
    ),
    primarySwatch: Colors.blue);

ThemeData themeArabic = ThemeData(
    appBarTheme: const AppBarTheme(
        backgroundColor: AppColor.darkprimary, foregroundColor: AppColor.white),
    fontFamily: "Cairo",
    textTheme: TextTheme(
      displayLarge: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 26,
      ),
      displayMedium: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 22,
      ),
      bodyLarge: TextStyle(
          fontWeight: FontWeight.w500,
          height: 2,
          fontSize: 16,
          color: AppColor.grey),
    ),
    primarySwatch: Colors.blue);
