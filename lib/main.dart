import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_cubit/cubit.dart';
import 'core/theme/theme_cubit/states.dart';
import 'features/chats/presentation/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeCubit = ThemeCubit();
  await themeCubit.loadTheme();

  runApp(
    BlocProvider(
      create: (_) => themeCubit,
      child: ScreenUtilInit(
        designSize:const Size(360, 690),
        minTextAdapt: true,
        builder: (context, child) =>const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final cubit = ThemeCubit.get(context);

        return MaterialApp(
          title: 'WhatsApp',
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: cubit.currentMode,
          themeAnimationCurve: Curves.fastOutSlowIn,
          themeAnimationDuration: const Duration(milliseconds: 1000),
          home:  HomeScreen(),
        );
      },
    );
  }
}