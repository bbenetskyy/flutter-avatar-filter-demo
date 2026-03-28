import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:get/get.dart';
import '../controllers/filter_controller.dart';
import '../controllers/avatar_controller.dart';

import 'package:flutter_avatar_filter_demo/style/app_dimens.dart';
import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding_70_5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/empty.png',
            width: AppDimens.width_165,
            height: AppDimens.height_165,
            fit: BoxFit.contain,
          ),
          Text(l10n.nothingFound, textAlign: TextAlign.center, style: Style.text22w700PrimaryStyle),
          const SizedBox(height: AppDimens.height_24),
          SizedBox(
            height: AppDimens.height_62,
            child: OutlinedButton(
              onPressed: () {
                Get.find<FilterController>().resetAll();
                Get.find<AvatarController>().reset();
              },
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: AppColors.borderDefault),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.radius_100)),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding_35),
                child: Text(l10n.clearFilters, style: Style.text16w600PrimaryStyle),
              ),
            ),
          ),
          const SizedBox(width: AppDimens.width_180, height: AppDimens.height_60),
        ],
      ),
    );
  }
}
