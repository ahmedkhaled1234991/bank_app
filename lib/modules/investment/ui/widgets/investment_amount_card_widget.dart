import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../generated/assets.dart';
import '../../logic/investment_cubit.dart';
import 'year_term_investment_amount_widget.dart';

class InvestmentAmountCardWidget extends StatelessWidget {
  const InvestmentAmountCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 336.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(20.r),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Investment Amount',
              style: AppStyles.styleSemiBold12.copyWith(
                color: AppColors.greyColor2,
              ),
            ),
          ),
          SizedBox(
            height: 4.h,
          ),
          SizedBox(
            height: 60.h,
            child: Row(
              children: [
                SizedBox(
                  width: 32,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.lightGrayColor,
                      fixedSize: const Size(32, 32),
                      backgroundColor: AppColors.backgroundColor,
                      elevation: 3,
                      shadowColor: AppColors.buttonShadowColor,
                      shape: const CircleBorder(),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      context.read<InvestmentCubit>().decreaseAmount();
                    },
                    child: Center(
                      child: SvgPicture.asset(Assets.iconsMinus),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: BlocBuilder<InvestmentCubit, InvestmentState>(
                      builder: (context, state) {
                        if (state is InvestmentAmountChanged) {
                          return Text(
                            '\$${state.investmentAmount.toString()}',
                            style: AppStyles.styleSemiBold36,
                          );
                        }
                        return Text(
                          '\$10000',
                          style: AppStyles.styleSemiBold36,
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  width: 32,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      foregroundColor: AppColors.lightGrayColor,
                      fixedSize: const Size(32, 32),
                      backgroundColor: AppColors.backgroundColor,
                      elevation: 3,
                      shadowColor: AppColors.buttonShadowColor,
                      shape: const CircleBorder(),
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {
                      context.read<InvestmentCubit>().increaseAmount();
                    },
                    child: Center(
                      child: SvgPicture.asset(Assets.iconsPlus),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          Center(
            child: Container(
              width: 84.w,
              height: 30.h,
              decoration: BoxDecoration(
                color: AppColors.greenColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: Text(
                  '6.81% YTM',
                  style: AppStyles.styleSemiBold13.copyWith(
                    color: AppColors.greenColor,
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          BlocBuilder<InvestmentCubit, InvestmentState>(
            builder: (context, state) {
              if (state is InvestmentAmountChanged) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    context.read<InvestmentCubit>().thirdYearTermIsSelected
                        ? const ActiveYearTermInvestmentAmountWidget(
                            name: '3 Year Term',
                          )
                        : const InactiveYearTermInvestmentAmountWidget(
                            name: '3 Year Term',
                          ),
                    SizedBox(
                      width: 10.w,
                    ),
                    context.read<InvestmentCubit>().fifthYearTermIsSelected
                        ? const ActiveYearTermInvestmentAmountWidget(
                            name: '5 Year Term',
                          )
                        : const InactiveYearTermInvestmentAmountWidget(
                            name: '5 Year Term',
                          ),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const InactiveYearTermInvestmentAmountWidget(
                    name: '3 Year Term',
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  const InactiveYearTermInvestmentAmountWidget(
                    name: '5 Year Term',
                  ),
                ],
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          BlocBuilder<InvestmentCubit, InvestmentState>(
            builder: (context, state) {
              var formatter = NumberFormat('#,###,000');
              if (state is InvestmentAmountChanged) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildLabelWithValue('Capital At Maturity',
                        '\$${formatter.format(state.capitalAtMaturity)}', true),
                    buildLabelWithValue('Total Interest',
                        '\$${formatter.format(state.totalInterest)}', false),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildLabelWithValue('Capital At Maturity', '\$10,681', true),
                  buildLabelWithValue('Total Interest', '\$681', false),
                ],
              );
            },
          ),
          SizedBox(
            height: 16.h,
          ),
          BlocBuilder<InvestmentCubit, InvestmentState>(
            builder: (context, state) {
              if (state is InvestmentAmountChanged) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    buildLabelWithValue('Annual Interest',
                        '\$${state.annualInterest.toStringAsFixed(1)}', true),
                    buildLabelWithValue('Average Maturity Date ',
                        state.averageMaturityDateYear.toString(), false),
                  ],
                );
              }
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildLabelWithValue('Annual Interest', '\$68.1', true),
                  buildLabelWithValue('Average Maturity Date ', '2026', false),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildLabelWithValue(String label, String value, bool alignLeft) {
    return Column(
      crossAxisAlignment:
          alignLeft ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: [
        Text(
          label,
          style: AppStyles.styleSemiBold12.copyWith(
            color: AppColors.greyColor,
          ),
        ),
        SizedBox(
          height: 7.h,
        ),
        Text(
          value,
          style: AppStyles.styleSemiBold22,
        ),
      ],
    );
  }
}
