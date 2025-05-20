import 'package:alarm_app/features/onboarding/presentation/views/onboarding_screen.dart';
import 'package:alarm_app/helpers/app_theme/app_colors.dart';
import 'package:alarm_app/helpers/bloc_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: BlocProviders.providers,
        child: MaterialApp(
          title: 'Alarm App',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: AppColors.backgroundDark327,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.purpleDarkCDF),
            useMaterial3: true,
          ),
          home: OnboardingScreen(),
        ));
  }
}