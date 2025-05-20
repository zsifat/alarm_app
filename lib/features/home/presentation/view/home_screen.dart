import 'package:alarm_app/common_widgets/custom_button.dart';
import 'package:alarm_app/constants/image_constants.dart';
import 'package:alarm_app/helpers/app_theme/app_colors.dart';
import 'package:alarm_app/helpers/app_theme/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../common_widgets/custom_alarm_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selected Location',
                      style: AppTextStyles.t16b600_FFF,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(ImageConstants.locationV2Icon),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Text(
                          "79 Regent's Park Rd, London NW1 8UY, United Kingdom",
                          style: AppTextStyles.t16b400_FFF,
                        ))
                      ],
                    ),
                    SizedBox(height: 10,),
                    CustomButton(
                      title: 'Add Alarm',
                      backgroundColor: AppColors.greyD4D,
                      titleTextStyle: AppTextStyles.t16b400_FFF,
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Alarms',
                    style: AppTextStyles.t18b500_FFF,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return CustomAlarmItem(
                            onChanged: (value) {},
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(height: 10,);
                        },
                        itemCount: 10),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
