import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class ConditionItemWidget extends StatelessWidget {
  final String iconPath;
  final String title;

  const ConditionItemWidget({
    super.key,
    required this.iconPath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.8),
      child: InkWell(
        splashColor: AppColors.greyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
        onTap: () {},
        child: Container(
          width: 165.w,
          height: 85.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                iconPath,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyColor5,
                  BlendMode.srcIn,
                ),
              ),
              const Spacer(),
              Text(
                title,
                style: AppStyles.styleSemiBold12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
