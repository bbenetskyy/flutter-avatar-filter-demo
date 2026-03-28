import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

import 'package:flutter_avatar_filter_demo/style/app_dimens.dart';

class PageHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBackTap;
  final List<HeaderFilterChip> chips;
  final bool anySelected;
  final VoidCallback onResetTap;

  const PageHeader({
    super.key,
    required this.title,
    required this.onBackTap,
    required this.chips,
    this.anySelected = false,
    required this.onResetTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.backgroundPrimary,
      child: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).padding.top + AppDimens.padding_9,
          bottom: AppDimens.padding_24,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: onBackTap,
              icon: SvgPicture.asset('assets/svg/arrow.svg', width: AppDimens.width_6, height: AppDimens.height_12),
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding_25, vertical: AppDimens.padding_15),
              alignment: Alignment.centerLeft,
              constraints: const BoxConstraints(),
            ),
            const SizedBox(height: AppDimens.height_12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding_24),
              child: Text(title, style: Style.text26w700PrimaryStyle),
            ),
            const SizedBox(height: AppDimens.height_12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding_24),
              child: Row(
                children: [
                  if (anySelected) ...[
                    GestureDetector(
                      onTap: onResetTap,
                      child: Container(
                        width: AppDimens.width_36,
                        height: AppDimens.height_36,
                        decoration: BoxDecoration(
                          color: AppColors.backgroundPrimary,
                          borderRadius: BorderRadius.circular(AppDimens.radius_8),
                          border: Border.all(color: AppColors.borderDefault, width: AppDimens.width_1),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/svg/close.svg',
                            width: AppDimens.width_24,
                            height: AppDimens.height_24,
                            colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppDimens.width_8),
                  ],
                  ...chips.map((chip) {
                    return Padding(
                      padding: const EdgeInsets.only(right: AppDimens.padding_12),
                      child: chip,
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
