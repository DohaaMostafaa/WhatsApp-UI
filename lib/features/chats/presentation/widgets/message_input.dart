import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';

Widget messageInput(BuildContext context) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
    child: Row(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).scaffoldBackgroundColor,
              borderRadius: BorderRadius.circular(25.r),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: Icon(Icons.emoji_emotions_outlined,
                      color: Colors.grey, size: 22.sp),
                  onPressed: () {},
                ),
                Expanded(
                  child: TextField(
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge
                        ?.copyWith(fontSize: 14.sp),
                    decoration: InputDecoration(
                      fillColor: Theme.of(context).scaffoldBackgroundColor,
                      hintText: "Message",
                      hintStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: Colors.grey, fontSize: 14.sp),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w, vertical: 8.h),
                      isDense: true,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.attach_file,
                      color: Colors.grey, size: 22.sp),
                  onPressed: () {},
                ),
                IconButton(
                  icon:
                  Icon(Icons.camera_alt, color: Colors.grey, size: 22.sp),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        const SizedBox(width: 6),
        _buildMicButton(),
      ],
    ),
  );
}

Widget _buildMicButton() {
  return Container(
    margin: const EdgeInsets.all(2),
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: AppColors.circleLight,
    ),
    child: ClipOval(
      child: Material(
        color: AppColors.circleLight,
        child: IconButton(
          icon: Icon(Icons.mic, color: Colors.white, size: 22.sp),
          onPressed: () {},
          splashColor: Colors.white24,
          highlightColor: Colors.white12,
        ),
      ),
    ),
  );
}