import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../generated/assets.dart';
import '../theming/app_colors.dart';
import '../theming/app_styles.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const BottomNavigationBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Colors.white,
      elevation: 0,
      selectedLabelStyle: AppStyles.styleRegular12,
      unselectedLabelStyle: AppStyles.styleRegular12,
      selectedItemColor: AppColors.primaryColor,
      unselectedItemColor: AppColors.lightGrayColor,
      currentIndex: selectedIndex,
      onTap: (index) => onTap(index),
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: SvgPicture.asset(
              Assets.iconsHome,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 0
                    ? AppColors.primaryColor
                    : AppColors.lightGrayColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: SvgPicture.asset(
              Assets.iconsInvestment,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 1
                    ? AppColors.primaryColor
                    : AppColors.lightGrayColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Investment',
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: SvgPicture.asset(
              Assets.iconsChat,
              width: 24,
              height: 24,
              colorFilter: ColorFilter.mode(
                selectedIndex == 2
                    ? AppColors.primaryColor
                    : AppColors.lightGrayColor,
                BlendMode.srcIn,
              ),
            ),
          ),
          label: 'Chat',
        ),
      ],
    );
  }
}
