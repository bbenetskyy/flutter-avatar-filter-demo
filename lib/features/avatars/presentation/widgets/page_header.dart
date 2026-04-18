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
      child: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
            top: AppDimens.headerTopPad,
            bottom: AppDimens.spaceXL,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: onBackTap,
                icon: SvgPicture.asset(
                  'assets/svg/arrow.svg',
                  width: AppDimens.backArrowW,
                  height: AppDimens.backArrowH,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimens.headerIconPadH,
                  vertical: AppDimens.headerIconPadV,
                ),
                alignment: Alignment.centerLeft,
                constraints: const BoxConstraints(),
              ),
              const SizedBox(height: AppDimens.spaceM),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.headerPadH),
                child: Text(title, style: Style.text26w700PrimaryStyle),
              ),
              const SizedBox(height: AppDimens.spaceM),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.headerPadH),
                child: Row(
                  children: [
                    if (anySelected) ...[
                      GestureDetector(
                        onTap: onResetTap,
                        child: Container(
                          width: AppDimens.chipSize,
                          height: AppDimens.chipSize,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundPrimary,
                            borderRadius: BorderRadius.circular(AppDimens.radiusS),
                            border: Border.all(color: AppColors.borderDefault, width: AppDimens.borderThin),
                          ),
                          child: Center(
                            child: SvgPicture.asset(
                              'assets/svg/close.svg',
                              width: AppDimens.iconSize,
                              height: AppDimens.iconSize,
                              colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: AppDimens.spaceS),
                    ],
                    ...chips.map((chip) {
                      return Padding(
                        padding: const EdgeInsets.only(right: AppDimens.spaceM),
                        child: chip,
                      );
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
