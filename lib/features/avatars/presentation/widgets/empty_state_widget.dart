import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:flutter_avatar_filter_demo/style/app_dimens.dart';
import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';

class EmptyStateWidget extends StatelessWidget {
  final VoidCallback onClearFilters;
  const EmptyStateWidget({super.key, required this.onClearFilters});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      top: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppDimens.emptyStatePadH),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/empty.png',
              width: AppDimens.emptyStateImageSize,
              height: AppDimens.emptyStateImageSize,
              fit: BoxFit.contain,
            ),
            Text(l10n.nothingFound, textAlign: TextAlign.center, style: Style.text22w700PrimaryStyle),
            const SizedBox(height: AppDimens.spaceXL),
            SizedBox(
              height: AppDimens.buttonHeight,
              child: OutlinedButton(
                onPressed: onClearFilters,
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.borderDefault),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppDimens.radiusFull)),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppDimens.clearBtnPadH),
                  child: Text(l10n.clearFilters, style: Style.text16w600PrimaryStyle),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
