import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

Widget buildSearchBar() {
  return Padding(
    padding: EdgeInsets.all(12.w),
    child: TextField(
      decoration: InputDecoration(
        hintText: "Ask Meta AI or Search",
        prefixIcon: Icon(Icons.search, size: 25.sp, color: AppColors.grey),
        filled: true,
        fillColor: Colors.grey[200],
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25.r),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}