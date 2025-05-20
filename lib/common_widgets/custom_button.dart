import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../helpers/app_theme/app_colors.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String title;
  final TextStyle? titleTextStyle;
  final String? iconPath;
  final Color? backgroundColor;
  final bool isLoading;

  const CustomButton(
      {super.key,
      this.onTap,
      required this.title,
      this.titleTextStyle,
      this.iconPath,
      this.backgroundColor = AppColors.purpleDarkCDF,
      this.isLoading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: isLoading
            ? SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: AppColors.whiteFFF,
                ))
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title, style: titleTextStyle),
                  if (iconPath != null) ...[
                    SizedBox(
                      width: 4,
                    ),
                    SvgPicture.asset(iconPath!)
                  ]
                ],
              ),
      ),
    );
  }
}
