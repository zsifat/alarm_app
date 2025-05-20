import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../helpers/app_theme/app_colors.dart';
import '../helpers/app_theme/app_textstyles.dart';

class CustomAlarmItem extends StatefulWidget {
  final ValueChanged onChanged;
  const CustomAlarmItem({super.key, required this.onChanged});

  @override
  State<CustomAlarmItem> createState() => _CustomAlarmItemState();
}

class _CustomAlarmItemState extends State<CustomAlarmItem> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: AppColors.greyD3F),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '7:10 pm',
            style: AppTextStyles.t24b400_FFF,
          ),
          Spacer(),
          Text(
            'Fri 21 Mar 2025',
            style: AppTextStyles.t14b400_FFF_Poppings,
          ),
          SizedBox(
            width: 4,
          ),
          Transform.scale(
            scale: 0.8,
            child: Switch.adaptive(
              value: isActive,
              onChanged: (value) {
                setState(() {
                  isActive=value;
                });
                widget.onChanged(value);
              },
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