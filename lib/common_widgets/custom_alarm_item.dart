import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/app_theme/app_colors.dart';
import '../helpers/app_theme/app_textstyles.dart';

class CustomAlarmItem extends StatelessWidget {
  final ValueChanged onChanged;
  final bool isEnabled;
  final String time;
  final String date;
  const CustomAlarmItem(
      {super.key,
      required this.onChanged,
      required this.date,
      required this.time,
      required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.greyD3F),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            time,
            style: AppTextStyles.t24b400_FFF,
          ),
          Spacer(),
          Text(
            date,
            style: AppTextStyles.t14b400_FFF_Poppings,
          ),
          SizedBox(
            width: 4,
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch.adaptive(
              value: isEnabled,
              onChanged: onChanged,
              activeTrackColor: AppColors.purpleDarkCDF,
              trackOutlineColor: null,
              inactiveTrackColor: AppColors.whiteFFF,
              inactiveThumbColor: AppColors.grey485,
            ),
          )
        ],
      ),
    );
  }
}
