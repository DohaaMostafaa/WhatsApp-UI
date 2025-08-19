import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/assets/app_assets.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../data/repositories/message_repository.dart';
import '../widgets/message_bubble.dart';
import '../widgets/message_input.dart';

class ConversationScreen extends StatelessWidget {
  final String name;

  const ConversationScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    final messages = MessageRepository().getMessages();

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: _buildAppBar(context),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              Theme.of(context).brightness == Brightness.dark
                  ? AppAssets.darkChatBg
                  : AppAssets.lightChatBg,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(10.w),
                itemCount: messages.length,
                itemBuilder: (context, index) =>
                    messageBubble(context, messages[index]),
              ),
            ),
            messageInput(context),
          ],
        ),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppColors.lightGrey,
            radius: 18.r,
            child: Text(
              name[0],
              style: AppTheme.lightTheme.textTheme.titleLarge,
            ),
          ),
          SizedBox(width: 10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "online",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        Icon(Icons.call, size: 22.sp),
        SizedBox(width: 15.w),
        Icon(Icons.videocam, size: 22.sp),
        SizedBox(width: 15.w),
        Icon(Icons.more_vert, size: 22.sp),
        SizedBox(width: 10.w),
      ],
    );
  }

}
