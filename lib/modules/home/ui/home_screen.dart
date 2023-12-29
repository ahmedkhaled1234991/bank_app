import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_styles.dart';
import '../../../generated/assets.dart';
import 'tabs/max_tab.dart';
import 'tabs/plus_tab.dart';
import 'tabs/standard_tab.dart';
import 'tabs/unlimited_tab.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  PageController pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
        titleSpacing: 12,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                Assets.iconsUser,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Good Morning',
              style: AppStyles.styleRegular10,
            ),
            Text(
              'Mehemet Taser',
              style: AppStyles.styleSemiBold14.copyWith(
                color: AppColors.userNameColor,
              ),
            )
          ],
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            onPressed: () {},
            icon: CircleAvatar(
              radius: 20,
              backgroundColor: Colors.white,
              child: SvgPicture.asset(
                Assets.iconsNotification,
                width: 24,
                height: 24,
              ),
            ),
          ),
          SizedBox(
            width: 16.w,
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          children: const [
            StandardTab(),
            PlusTab(),
            MaxTab(),
            UnlimitedTab(),
          ],
        ),
      ),
    );
  }
}
