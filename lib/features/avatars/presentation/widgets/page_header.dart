import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:math' as math;

class PageHeader extends StatelessWidget {
  final String title;
  final VoidCallback onBackTap;
  final List<HeaderFilterChip> chips;

  const PageHeader({super.key, required this.title, required this.onBackTap, required this.chips});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.backgroundPrimary,
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 8, bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: IconButton(
              onPressed: onBackTap,
              icon: SvgPicture.asset('assets/svg/arrow.svg', width: 10, height: 18),
              padding: EdgeInsets.zero,
              alignment: Alignment.centerLeft,
              constraints: const BoxConstraints(),
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Text(title, style: Style.text26w700PrimaryStyle.copyWith(fontSize: 32)),
          ),
          const SizedBox(height: 24),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              children: chips.map((chip) {
                return Padding(padding: const EdgeInsets.only(right: 12), child: chip);
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderFilterChip extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isActive;

  const HeaderFilterChip({super.key, required this.label, required this.onTap, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.backgroundPrimary,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.borderDefault, width: 1),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: (isActive
                  ? Style.text16w600PrimaryStyle
                  : Style.text16w600PrimaryStyle.copyWith(fontWeight: FontWeight.w500)),
            ),
            const SizedBox(width: 8),
            Transform.rotate(
              angle: -90 * math.pi / 180,
              child: SvgPicture.asset(
                'assets/svg/arrow.svg',
                width: 6,
                height: 10,
                colorFilter: const ColorFilter.mode(AppColors.textPrimary, BlendMode.srcIn),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
