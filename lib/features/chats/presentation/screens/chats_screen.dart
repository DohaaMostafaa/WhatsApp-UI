import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/theme_cubit/cubit.dart';
import '../../../../core/theme/theme_cubit/states.dart';
import '../chats_cubit/cubit.dart';
import '../chats_cubit/states.dart';
import '../widgets/chat_item.dart';
import '../widgets/chat_tabs.dart';
import '../widgets/search_bar.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatsCubit()..loadChats(),
      child: const _ChatsView(),
    );
  }
}

class _ChatsView extends StatelessWidget {
  const _ChatsView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: [
          buildSearchBar(),
          BlocBuilder<ChatsCubit, ChatsState>(
            builder: (context, state) {
              final cubit = ChatsCubit.get(context);
              return buildChatTabs(cubit.selectedIndex, cubit.selectTab);
            },
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: BlocBuilder<ChatsCubit, ChatsState>(
              builder: (context, state) {
                if (state is ChatsLoaded) {
                  return ListView.builder(
                    itemCount: state.filteredChats.length,
                    itemBuilder: (context, index) {
                      final chat = state.filteredChats[index];
                      return buildChatItem(context, chat);
                    },
                  );
                }
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.accent),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text(
        "WhatsApp",
        style: TextStyle(fontSize: 23.sp, fontWeight: FontWeight.bold),
      ),
      elevation: 0,
      actions: [
        // Theme Toggle
        BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            final cubit = ThemeCubit.get(context);
            return IconButton(
              icon: Icon(
                cubit.currentMode == ThemeMode.dark
                    ? Icons.light_mode
                    : Icons.dark_mode,
                size: 24.sp,
              ),
              onPressed: cubit.toggleTheme,
            );
          },
        ),
        IconButton(icon: Icon(Icons.camera_alt_outlined, size: 24.sp), onPressed: () {}),
        IconButton(icon: Icon(Icons.more_vert, size: 24.sp), onPressed: () {}),
      ],
    );
  }

}