import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';

class IndicatorsWidget extends StatelessWidget {
  final int activeIndex;
  const IndicatorsWidget({
    super.key,
    required this.activeIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        4,
        (index) => Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == activeIndex
                  ? AppColors.primaryColor
                  : AppColors.inActiveDotsColor,
            ),
          ),
        ),
      ).toList(),
    );
  }
}
