import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;
import 'package:flutter_avatar_filter_demo/style/app_dimens.dart';

class HeaderFilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;
  final int count;

  static const double _kArrowRotation = -math.pi / 2;

  const HeaderFilterChip({
    super.key,
    required this.label,
    required this.onTap,
    this.isActive = false,
    this.count = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimens.chipSize,
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.spaceM),
        decoration: BoxDecoration(
          color: AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(AppDimens.radiusS),
          border: Border.all(color: AppColors.borderDefault, width: AppDimens.borderThin),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: Style.text12w600PrimaryStyle),
            if (count > 0) ...[
              const SizedBox(width: AppDimens.spaceXS),
              Container(
                width: AppDimens.filterBadgeW,
                height: AppDimens.filterBadgeH,
                decoration: const BoxDecoration(color: AppColors.textPrimary, shape: BoxShape.circle),
                child: Center(child: Text(count.toString(), style: Style.text12w700SecondaryStyle)),
              ),
            ],
            const SizedBox(width: AppDimens.spaceM),
            Transform.rotate(
              angle: _kArrowRotation,
              child: SvgPicture.asset(
                'assets/svg/arrow.svg',
                width: AppDimens.chipArrowSize,
                height: AppDimens.chipArrowSize,
                colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
