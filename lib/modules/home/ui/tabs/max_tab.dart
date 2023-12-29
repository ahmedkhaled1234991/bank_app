import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../../generated/assets.dart';
import '../widgets/bank_card_widget.dart';
import '../widgets/condition_item_widget.dart';
import '../widgets/indicators_widget.dart';
import '../widgets/what_you_get_item_widget.dart';

class MaxTab extends StatelessWidget {
  const MaxTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 16.h,
          ),
          const BankCardWidget(
            cardType: 'Max',
            logoPath: Assets.imagesUbs,
            logoWidth: 120,
            logoHeight: 45,
          ),
          SizedBox(
            height: 16.h,
          ),
          const IndicatorsWidget(activeIndex: 2),
          SizedBox(
            height: 14.h,
          ),
          Text(
            'Conditions',
            style: AppStyles.styleSemiBold16,
          ),
          SizedBox(
            height: 16.h,
          ),
          Row(
            children: [
              const ConditionItemWidget(
                iconPath: Assets.iconsNoMinimumDeposit,
                title: 'No Minimum Deposit',
              ),
              SizedBox(
                width: 13.w,
              ),
              const ConditionItemWidget(
                iconPath: Assets.iconsBank,
                title: '\$15/Month (Paid Annually)',
              ),
            ],
          ),
          SizedBox(
            height: 14.h,
          ),
          Text(
            'What You Get',
            style: AppStyles.styleSemiBold16,
          ),
          SizedBox(
            height: 16.h,
          ),
          Flexible(
            child: GridView.builder(
              itemCount: 6,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12.5.w,
                mainAxisSpacing: 16.h,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, index) {
                return WhatYouGetItemWidget(
                  index: index,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
