import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/app_dimens.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppCheckbox extends StatelessWidget {
  final bool selected;

  const AppCheckbox({super.key, required this.selected});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      width: AppDimens.checkboxSize,
      height: AppDimens.checkboxSize,
      decoration: BoxDecoration(
        color: selected ? AppColors.textPrimary : AppColors.backgroundPrimary,
        borderRadius: BorderRadius.circular(AppDimens.radiusXS),
        border: Border.all(color: selected ? AppColors.textPrimary : AppColors.borderGrayMid, width: AppDimens.checkboxBorderWidth),
      ),
      child: selected
          ? Center(
              child: SvgPicture.asset(
                'assets/svg/check.svg',
                width: AppDimens.checkboxIconSize,
                height: AppDimens.checkboxIconSize,
                colorFilter: const ColorFilter.mode(AppColors.textSecondary, BlendMode.srcIn),
              ),
            )
          : null,
    );
  }
}
