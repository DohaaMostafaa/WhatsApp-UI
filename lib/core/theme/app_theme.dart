import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.lightBackground,
      foregroundColor: AppColors.primary,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: AppColors.accent,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: const IconThemeData(color: Colors.black),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),
    dividerColor: AppColors.dividerLight,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: 16.sp,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondaryLight,
        fontSize: 14.sp,
      ),
      titleLarge: TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: AppColors.primary,
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.textSecondaryLight,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.grey[100],
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: Colors.grey[600], fontSize: 14.sp),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accent,
      unselectedItemColor: AppColors.darkBackground,
      backgroundColor: AppColors.lightBackground,
      type: BottomNavigationBarType.fixed,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.lightSelectedItem,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
      ),
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.darkBackground,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: Colors.white,
        fontSize: 20.sp,
        fontWeight: FontWeight.w600,
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.accent,
      foregroundColor: Colors.white,
      shape: CircleBorder(),
    ),
    dividerColor: AppColors.dividerDark,
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: 16.sp,
      ),
      bodyMedium: TextStyle(
        color: AppColors.textSecondaryDark,
        fontSize: 14.sp,
      ),
      titleLarge: TextStyle(
        color: AppColors.textPrimaryDark,
        fontSize: 18.sp,
        fontWeight: FontWeight.w500,
      ),
      bodySmall: TextStyle(
        color: AppColors.lightSelectedItem,
        fontWeight: FontWeight.bold,
        fontSize: 12.sp,
      ),
    ),
    iconTheme: const IconThemeData(
      color: AppColors.textSecondaryDark,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: AppColors.darkSelectedItem,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.r),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: Colors.grey[400], fontSize: 14.sp),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: AppColors.accent,
      unselectedItemColor: AppColors.lightBackground,
      backgroundColor: AppColors.darkBackground,
      type: BottomNavigationBarType.fixed,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.r),
        ),
      ),
    ),

  );
}
