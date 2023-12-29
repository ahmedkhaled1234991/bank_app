import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../generated/assets.dart';
import '../../../home/data/models/bond_model.dart';

class BoundItemWidget extends StatelessWidget {
  final int index;
  BoundItemWidget({
    super.key,
    required this.index,
  });

  List<BondModel> bounds = [
    BondModel(
      name: 'Netflix INC',
      creditRating: 'BBB',
      imagePath: Assets.imagesNetflix,
      annualPercentageYield: 5.37,
    ),
    BondModel(
      name: 'Ford Motor LLC',
      creditRating: 'BB+',
      imagePath: Assets.imagesFord,
      annualPercentageYield: 7.71,
    ),
    BondModel(
      name: 'Apple INC',
      creditRating: 'AA+',
      imagePath: Assets.imagesApple,
      annualPercentageYield: 4.85,
    ),
    BondModel(
      name: 'Morgan Stanley',
      creditRating: 'A-',
      imagePath: Assets.imagesMorganStanley,
      annualPercentageYield: 6.27,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Container(
        width: double.infinity,
        height: 72.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 10.h,
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: AppColors.backgroundColor,
              child: Image.asset(
                bounds[index].imagePath,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  bounds[index].name,
                  style: AppStyles.styleSemiBold16.copyWith(
                    color: Colors.black,
                  ),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  bounds[index].creditRating,
                  style: AppStyles.styleRegular12.copyWith(
                    color: AppColors.greyColor4,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              '${bounds[index].annualPercentageYield.toString()}% APY',
              style: AppStyles.styleSemiBold14.copyWith(
                color: AppColors.greenColor,
              ),
            ),
            SizedBox(
              width: 9.w,
            ),
          ],
        ),
      ),
    );
  }
}
