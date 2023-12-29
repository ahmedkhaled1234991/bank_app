import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../generated/assets.dart';

class BankCardWidget extends StatelessWidget {
  final String cardType;
  final String logoPath;
  final double logoWidth;
  final double logoHeight;

  const BankCardWidget({
    super.key,
    required this.cardType,
    required this.logoPath,
    required this.logoWidth,
    required this.logoHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 326.w,
      height: 156.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 56.h,
                child: RichText(
                  text: TextSpan(
                    text: 'bünd\n',
                    style: AppStyles.styleBold23.copyWith(
                      height: 1.24,
                    ),
                    children: [
                      TextSpan(
                        text: cardType,
                        style: AppStyles.styleRegular23,
                      ),
                    ],
                  ),
                ),
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(4),
                  onTap: () {},
                  child: Container(
                    width: 98.w,
                    height: 34.h,
                    decoration: BoxDecoration(
                      color: AppColors.buttonCardColor,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: 9.w,
                      vertical: 8.h,
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          Assets.iconsArrow2,
                          width: 16.w,
                          height: 16.w,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text(
                          'Start Now',
                          style: AppStyles.styleMedium13,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: logoWidth.w,
            height: logoHeight.h,
            child: Image.asset(
              logoPath,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
