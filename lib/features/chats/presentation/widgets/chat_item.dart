import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:whatsup/features/chats/presentation/widgets/unread_badge.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/models/chat_model.dart';
import '../screens/conversition_screen.dart';

Widget buildChatItem(BuildContext context, ChatModel chat) {
  return OpenContainer(
    transitionDuration: const Duration(milliseconds: 500),
    closedElevation: 0,
    closedColor: Colors.transparent,
    openBuilder: (context, closeContainer) => ConversationScreen(name: chat.name),
    closedBuilder: (context, openContainer) => ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
      leading: CircleAvatar(
        backgroundColor: AppColors.lightGrey,
        radius: 24.r,
        child: Text(
          chat.name[0],
          style: AppTheme.lightTheme.textTheme.titleLarge,
        ),
      ),
      title: Text(chat.name),
      subtitle: Padding(
        padding: EdgeInsets.only(top: 4.h),
        child: Text(
          chat.message,
          style: Theme.of(context).textTheme.bodyMedium,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      trailing: buildChatTrailing(chat),
      onTap: openContainer,
    ),
  );
}
