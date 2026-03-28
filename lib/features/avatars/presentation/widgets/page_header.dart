import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'header_filter_chip.dart';

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
