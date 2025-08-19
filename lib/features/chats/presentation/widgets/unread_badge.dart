import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../data/models/chat_model.dart';

Widget buildChatTrailing(ChatModel chat) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Text(
        chat.time,
        style: TextStyle(fontSize: 12.sp, color: AppColors.grey),
      ),
      if (chat.unread > 0)
        Container(
          margin: EdgeInsets.only(top: 6.h),
          width: 20.w,
          height: 20.h,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: AppColors.accent,
            shape: BoxShape.circle,
          ),
          child: Text(
            chat.unread.toString(),
            style: TextStyle(
              color: AppColors.lightBackground,
              fontSize: 10.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
    ],
  );
}
