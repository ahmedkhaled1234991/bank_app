import 'package:bank_app/modules/main/main_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../generated/assets.dart';
import '../logic/investment_cubit.dart';
import 'widgets/bound_item_widget.dart';
import 'widgets/investment_amount_card_widget.dart';

class InvestmentScreen extends StatelessWidget {
  const InvestmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Fixed Income',
          style: AppStyles.styleSemiBold20,
        ),
        leadingWidth: 24,
        leading: IconButton(
          padding: const EdgeInsets.only(top: 4, left: 8),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const MainLayout(),
              ),
            );
          },
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 24,
            color: AppColors.darkBlueColor,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => InvestmentCubit(),
        child: BlocBuilder<InvestmentCubit, InvestmentState>(
          builder: (context, state) {
            if (state is InvestmentLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: AppColors.primaryColor,
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Stack(
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          // Fixed Income Portfolio Section
                          Text(
                            'Fixed Income Portfolio',
                            style: AppStyles.styleSemiBold22.copyWith(
                              color: AppColors.darkGreyColor,
                            ),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text(
                            'A fixed income portfolio consists of bonds and other securities providing steady income and relatively lower risk.',
                            style: AppStyles.styleSemiBold14.copyWith(
                              color: AppColors.blueGrayColor,
                              height: 1.6,
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          // Annual Yield To Maturity (YTM) Section
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Annual Yield To Maturity (YTM)',
                                style: AppStyles.styleSemiBold16.copyWith(
                                  color: AppColors.greyColor2,
                                ),
                              ),
                              SizedBox(
                                width: 5.w,
                              ),
                              SvgPicture.asset(
                                Assets.iconsInfo,
                                width: 18,
                                height: 18,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Center(
                            child: Text(
                              '6.81%',
                              style: AppStyles.styleSemiBold31,
                            ),
                          ),
                          SizedBox(
                            height: 12.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Average Rating',
                                style: AppStyles.styleSemiBold12.copyWith(
                                  color: AppColors.greyColor,
                                ),
                              ),
                              Text(
                                'Bonds',
                                style: AppStyles.styleSemiBold12.copyWith(
                                  color: AppColors.greyColor,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'AA',
                                style: AppStyles.styleSemiBold22,
                              ),
                              Text(
                                '20 Companies',
                                style: AppStyles.styleSemiBold22,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          // Term Types Section
                          Text(
                            'Term Types',
                            style: AppStyles.styleSemiBold12.copyWith(
                              color: AppColors.greyColor,
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              termTypesItem('3 Year Term'),
                              SizedBox(
                                width: 10.w,
                              ),
                              termTypesItem('5 Year Term'),
                            ],
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                          // Investment Calculator Section
                          Text(
                            'Investment Calculator',
                            style: AppStyles.styleSemiBold16.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          const InvestmentAmountCardWidget(),
                          SizedBox(
                            height: 30.h,
                          ),
                          // Bonds Section
                          Text(
                            'Bonds',
                            style: AppStyles.styleSemiBold16.copyWith(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Flexible(
                            child: ListView.builder(
                              itemCount: 4,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return BoundItemWidget(
                                  index: index,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            height: 87.h,
                          ),
                        ],
                      ),
                    ),
                    // Investment Account Button
                    Positioned(
                      bottom: 11.h,
                      left: 0,
                      right: 0,
                      child: AppTextButton(
                        buttonText: 'Create Investment Account',
                        textStyle: AppStyles.styleBold16.copyWith(
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget termTypesItem(String title) {
    return Container(
      width: 107.w,
      height: 30.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.1),
        ),
      ),
      child: Center(
        child: Text(
          title,
          style: AppStyles.styleSemiBold13,
        ),
      ),
    );
  }
}
