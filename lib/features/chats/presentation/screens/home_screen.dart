import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../status/presentation/screens/status_screen.dart';
import '../chats_cubit/cubit.dart';
import '../chats_cubit/states.dart';
import 'chats_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final List<Widget> _screens =  [
    ChatsScreen(),
    UpdatesScreen(),
    UpdatesScreen(),
    UpdatesScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ChatsCubit(),
      child: BlocBuilder<ChatsCubit, ChatsState>(
        builder: (context, state) {
          var cubit = ChatsCubit.get(context);
          return Scaffold(
            body: _screens[cubit.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.selectedIndex,
              onTap: cubit.onItemTapped,
              selectedLabelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
              unselectedLabelStyle: TextStyle(fontSize: 12.sp),
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat, size: 24.sp),
                  label: "Chats",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.update, size: 24.sp),
                  label: "Updates",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.groups_outlined, size: 24.sp),
                  label: "Communities",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.call_outlined, size: 24.sp),
                  label: "Calls",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
