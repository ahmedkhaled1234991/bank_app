import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../generated/assets.dart';
import '../../../investment/data/models/what_you_get_item_model.dart';

class WhatYouGetItemWidget extends StatelessWidget {
  final int index;

  WhatYouGetItemWidget({
    super.key,
    required this.index,
  });

  List<WhatYouGetItemModel> items = [
    const WhatYouGetItemModel(
      iconPath: Assets.iconsBank,
      title: 'Swiss Bank Account',
    ),
    const WhatYouGetItemModel(
      iconPath: Assets.iconsMastercardPrepaid,
      title: 'Mastercard Prepaid',
    ),
    const WhatYouGetItemModel(
      iconPath: Assets.iconsAccountOpenSameDay,
      title: 'Account Open Same Day',
    ),
    const WhatYouGetItemModel(
      iconPath: Assets.iconsProtectedUpTo,
      title: 'Protected up to \$100,000',
    ),
    const WhatYouGetItemModel(
      iconPath: Assets.iconsInvestmentsPortolios,
      title: 'Investments Portfolios',
    ),
    const WhatYouGetItemModel(
      iconPath: Assets.iconsDepositsOptions,
      title: 'Deposits Options',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withOpacity(0.8),
      child: InkWell(
        splashColor: AppColors.greyColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(6),
        onTap: () {},
        child: Container(
          width: 106.w,
          height: 102.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          padding: EdgeInsets.symmetric(vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset(
                items[index].iconPath,
                colorFilter: const ColorFilter.mode(
                  AppColors.greyColor5,
                  BlendMode.srcIn,
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 90.w,
                child: Text(
                  items[index].title,
                  style: AppStyles.styleSemiBold12,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
