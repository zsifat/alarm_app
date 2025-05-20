import 'package:alarm_app/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:alarm_app/helpers/app_theme/app_colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alarm App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundDark327,
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purpleDarkCDF),
        useMaterial3: true,
      ),
      home: OnboardingScreen(),
    );
  }
}