import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/message_model.dart';
import 'audio_message.dart';

Widget messageBubble(BuildContext context, MessageModel msg) {
  final bool isMe = msg.isMe;
  final bool isDark = Theme.of(context).brightness == Brightness.dark;

  final Color bubbleColor = isMe
      ? (isDark ? AppColors.sentBubbleDark : AppColors.sentBubbleLight)
      : (isDark ? AppColors.receivedBubbleDark : AppColors.receivedBubbleLight);

  return Align(
    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
      constraints: BoxConstraints(maxWidth: 300.w),
      decoration: BoxDecoration(
        color: bubbleColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.r),
          topRight: Radius.circular(16.r),
          bottomLeft: isMe ? Radius.circular(16.r) : Radius.circular(2.r),
          bottomRight: isMe ? Radius.circular(2.r) : Radius.circular(16.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildMessageContent(context, msg),
          SizedBox(height: 4.h),
          Text(
            msg.time,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
              fontSize: 11.sp,
              color: AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget _buildMessageContent(BuildContext context, MessageModel msg) {
  switch (msg.type) {
    case "text":
      return Text(
        msg.content,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 15.sp),
      );
    case "image":
      return ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset(
          msg.content,
          width: 200.w,
          height: 200.h,
          fit: BoxFit.cover,
          errorBuilder: (_, __, ___) => Container(
            width: 200.w,
            height: 200.h,
            color: AppColors.lightGrey,
            child: const Icon(Icons.broken_image, color: Colors.red),
          ),
        ),
      );
    case "audio":
      return buildAudioMessage(context, msg);
    default:
      return const SizedBox.shrink();
  }
}