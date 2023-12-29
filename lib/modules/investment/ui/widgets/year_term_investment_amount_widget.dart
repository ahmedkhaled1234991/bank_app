import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../logic/investment_cubit.dart';

class InactiveYearTermInvestmentAmountWidget extends StatelessWidget {
  final String name;

  const InactiveYearTermInvestmentAmountWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.backgroundColor,
      child: InkWell(
        splashColor: AppColors.primaryColor.withOpacity(0.2),
        borderRadius: BorderRadius.circular(4),
        onTap: () {
          context.read<InvestmentCubit>().switchYearTerm(name);
        },
        child: Container(
          width: 106.w,
          height: 30.h,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              name,
              style: AppStyles.styleSemiBold13.copyWith(
                color: AppColors.greyColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActiveYearTermInvestmentAmountWidget extends StatelessWidget {
  final String name;
  const ActiveYearTermInvestmentAmountWidget({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 106.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: AppColors.greyColor3,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.primaryColor,
        ),
      ),
      child: Center(
        child: Text(
          name,
          style: AppStyles.styleSemiBold13.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
