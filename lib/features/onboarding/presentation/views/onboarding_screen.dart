import 'package:alarm_app/features/wellcome/presentation/view/wellcome_screen.dart';
import 'package:alarm_app/helpers/app_theme/app_colors.dart';
import 'package:alarm_app/helpers/app_theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../common_widgets/custom_button.dart';
import '../../data/model/onboard_page_model.dart';
import '../widgets/onboarding_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardPageModel> onboardModels = [
    OnboardPageModel(
      gifAsset: 'assets/gifs/onboard_gif_1.gif',
      title: 'Sync with Nature’s Rhythm',
      description:
          'Experience a peaceful transition into the evening with an alarm that aligns with the sunset."Your perfect reminder, always 15 minutes before sundown',
    ),
    OnboardPageModel(
      gifAsset: 'assets/gifs/onboard_gif_2.gif',
      title: 'Effortless & Automatic',
      description:
          'No need to set alarms manually. Wakey calculates the sunset time for your location and alerts you on time.',
    ),
    OnboardPageModel(
      gifAsset: 'assets/gifs/onboard_gif_3.gif',
      title: 'Relax & Unwind',
      description: 'hope to take the courage to pursue your dreams.',
    ),
  ];

  void _nextPage() {
    if (_currentPage < onboardModels.length - 1) {
      _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => WelcomeScreen(),
          ));
    }
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.backgroundDark327,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onboardModels.length,
              onPageChanged: (index) => setState(() => _currentPage = index),
              itemBuilder: (context, index) =>
                  OnBoardWidget(onboardModel: onboardModels[index], screenHeight: screenHeight),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: onboardModels.length,
                  effect: WormEffect(
                      dotHeight: 8,
                      dotWidth: 8,
                      activeDotColor: AppColors.purple4F3,
                      dotColor: AppColors.grey485),
                ),
                const SizedBox(height: 16),
                CustomButton(
                    title: 'Next', onTap: _nextPage, titleTextStyle: AppTextStyles.t16b700_FFF),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
