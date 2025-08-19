import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/message_model.dart';

Widget buildAudioMessage(BuildContext context, MessageModel msg) {
  final bool isMe = msg.isMe;
  final Color waveColor =
  isMe ? AppColors.primary : AppColors.textSecondaryLight;
  final Color playBgColor = isMe ? AppColors.primary : AppColors.lightGrey;

  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      // Play Button
      Container(
        width: 30.w,
        height: 30.w,
        decoration: BoxDecoration(
          color: playBgColor,
          shape: BoxShape.circle,
        ),
        child: Icon(Icons.play_arrow, size: 16.sp),
      ),
      SizedBox(width: 10.w),

      // Waveform (5 bars)
      SizedBox(
        width: 100.w,
        height: 20.h,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(5, (i) {
            final heights = [8.h, 4.h, 12.h, 6.h, 10.h];
            return Container(
              width: 3.w,
              height: heights[i],
              margin: EdgeInsets.symmetric(horizontal: 1.w),
              decoration: BoxDecoration(
                color: waveColor,
                borderRadius: BorderRadius.circular(2.r),
              ),
            );
          }),
        ),
      ),
      SizedBox(width: 8.w),

      // Duration
      Text(
        msg.content,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    ],
  );
}
