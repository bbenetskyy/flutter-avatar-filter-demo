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
  final double rotationAngle = -90 * math.pi / 180;

  const HeaderFilterChip({super.key, required this.label, required this.onTap, this.isActive = false, this.count = 0});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: AppDimens.height_36,
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding_12),
        decoration: BoxDecoration(
          color: AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(AppDimens.radius_8),
          border: Border.all(color: AppColors.borderDefault, width: AppDimens.width_1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(label, style: Style.text12w600PrimaryStyle),
            if (count > 0) ...[
              const SizedBox(width: AppDimens.width_4),
              Container(
                width: AppDimens.width_16,
                height: AppDimens.height_18,
                decoration: const BoxDecoration(color: AppColors.textPrimary, shape: BoxShape.circle),
                child: Center(child: Text(count.toString(), style: Style.text12w700SecondaryStyle)),
              ),
            ],
            const SizedBox(width: AppDimens.width_12),
            Transform.rotate(
              angle: rotationAngle,
              child: SvgPicture.asset(
                'assets/svg/arrow.svg',
                width: AppDimens.width_12,
                height: AppDimens.height_12,
                colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
