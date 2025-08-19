import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

Widget buildChatTabs(int selectedTabIndex,Function(int index) onItemTapped) {
  const List<String> tabLabels = ["All", "Unread", "Favourites", "Groups"];
  return SizedBox(
    height: 25.h,
    child: ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      itemCount: tabLabels.length + 1,
      separatorBuilder: (_, __) => SizedBox(width: 8.w),
      itemBuilder: (context, index) {
        if (index == tabLabels.length) {
          return Icon(
            Icons.add_circle_outline,
            size: 28.sp,
          );
        }
        final isActive = index == selectedTabIndex;
        return GestureDetector(
          onTap:() => onItemTapped(index),
          child: _buildTab(tabLabels[index], isActive),
        );
      },
    ),
  );
}

Widget _buildTab(String text, bool isActive) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
    decoration: BoxDecoration(
      color: isActive ? AppColors.lightSelectedItem : AppColors.lightBackground,
      borderRadius: BorderRadius.circular(20.r),
      border: Border.all(color: AppColors.lightGrey, width: 0.9.w),
    ),
    child: Text(
      text,
      style: TextStyle(
        color: isActive ? AppColors.primary : AppColors.textPrimaryLight,
        fontWeight: FontWeight.w500,
        fontSize: 14.sp,
      ),
    ),
  );
}
