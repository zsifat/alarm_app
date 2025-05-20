import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../helpers/app_theme/app_textstyles.dart';
import '../../../wellcome/presentation/view/wellcome_screen.dart';
import '../../data/model/onboard_page_model.dart';

class OnBoardWidget extends StatelessWidget {
  const OnBoardWidget({
    super.key,
    required this.onboardModel,
    required this.screenHeight,
  });

  final OnboardPageModel onboardModel;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                child: Image.asset(
                  onboardModel.gifAsset,
                  fit: BoxFit.cover,
                  height: screenHeight * 0.5,
                  width: double.infinity,
                ),
              ),
              Positioned(
                  top: 40,
                  right: 10,
                  child: TextButton(
                      style: TextButton.styleFrom(padding: EdgeInsets.zero),
                      onPressed: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WelcomeScreen(),
                            ));
                      },
                      child: Text(
                        'Skip',
                        style: AppTextStyles.t16b700_FFF,
                      )))
            ],
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              onboardModel.title,
              style: AppTextStyles.t34b600_FFF.copyWith(
                shadows: [
                  Shadow(
                    offset: Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              onboardModel.description,
              textAlign: TextAlign.left,
              style: AppTextStyles.t14b400_FFF,
            ),
          ),
        ],
      ),
    );
  }
}