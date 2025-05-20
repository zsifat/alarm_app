import 'package:alarm_app/common_widgets/custom_button.dart';
import 'package:alarm_app/constants/image_constants.dart';
import 'package:alarm_app/features/home/presentation/view/home_screen.dart';
import 'package:alarm_app/helpers/app_theme/app_colors.dart';
import 'package:alarm_app/helpers/app_theme/app_textstyles.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome! Your Personalized Alarm',
              style: AppTextStyles.t34b600_FFF,
            ),
            SizedBox(
              height: 16,
            ),
            Text(
              'Allow us to sync your sunset alarm based on your location.',
              style: AppTextStyles.t16b400_FFF,
            ),
            SizedBox(
              height: 50,
            ),
            Image.asset('assets/images/sunset.png',),
            SizedBox(
              height: 8,
            ),
            CustomButton(
              title: 'Use Current Location',
              backgroundColor: AppColors.greyD4D,
              titleTextStyle: AppTextStyles.t16b400_FFF,
              iconPath: ImageConstants.locationIcon,
            ),
            SizedBox(
              height: 8,
            ),
            CustomButton(
              title: 'Home',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
              },
              backgroundColor: AppColors.greyD4D,
              titleTextStyle: AppTextStyles.t16b400_FFF,
            ),
          ],
        ),
      ),
    );
  }
}
