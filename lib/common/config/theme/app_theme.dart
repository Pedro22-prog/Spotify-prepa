import 'package:flutter/material.dart';
import 'package:spotify_prepa/common/config/theme/app_color.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColor.primaty,
    scaffoldBackgroundColor: AppColor.lightBackground,
    fontFamily: 'Satoshi',
    sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(40),
      hintStyle: const TextStyle(
        color: Color(0xff383838),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.black,
          width: 4.0
        )
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaty,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ) 
      )
    )
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColor.primaty,
    scaffoldBackgroundColor: AppColor.darkBackground,
    fontFamily: 'Satoshi',
    sliderTheme: SliderThemeData(overlayShape: SliderComponentShape.noOverlay),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: const EdgeInsets.all(40),
      hintStyle: const TextStyle(
        color: Color(0xffA7A7A7),
        fontWeight: FontWeight.w500,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
        borderSide: const BorderSide(
          color: Colors.white,
          width: 4.0
        )
      )
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primaty,
        elevation: 0,
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ) 
      )
    )
  );
}
