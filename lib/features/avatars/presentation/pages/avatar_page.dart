import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:get/get.dart';
import '../controllers/avatar_loader_controller.dart';
import '../controllers/avatar_filter_controller.dart';
import '../coordinator/avatar_page_coordinator.dart';
import '../widgets/avatar_grid.dart';
import '../widgets/header_filter_chip.dart';
import '../widgets/page_header.dart';

import 'package:flutter_avatar_filter_demo/style/app_dimens.dart';
import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loader = Get.find<AvatarLoaderController>();
    final filter = Get.find<AvatarFilterController>();
    final coordinator = Get.find<AvatarPageCoordinator>();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: Column(
        children: [
          Obx(
            () => PageHeader(
              title: l10n.allAvatars,
              onBackTap: coordinator.goBack,
              anySelected: filter.hasActiveFilters,
              onResetTap: filter.clearFilters,
              chips: [
                HeaderFilterChip(
                  label: l10n.gender,
                  isActive: filter.selectedGenders.isNotEmpty,
                  count: filter.selectedGenders.length,
                  onTap: () => coordinator.showGenderFilter(context, l10n),
                ),
                HeaderFilterChip(
                  label: l10n.age,
                  isActive: filter.selectedAgeGroups.isNotEmpty,
                  count: filter.selectedAgeGroups.length,
                  onTap: () => coordinator.showAgeFilter(context, l10n),
                ),
                HeaderFilterChip(
                  label: l10n.pose,
                  isActive: filter.selectedPoses.isNotEmpty,
                  count: filter.selectedPoses.length,
                  onTap: () => coordinator.showPoseFilter(context, l10n),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (loader.isLoading.value) {
                return const SafeArea(
                  top: false,
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (loader.errorMessage.isNotEmpty) {
                return _ErrorStateWidget(
                  message: loader.errorMessage.value,
                  onRetry: loader.load,
                );
              }
              return AvatarGrid(
                avatars: filter.filteredAvatars.toList(),
                onClearFilters: filter.clearFilters,
              );
            }),
          ),
        ],
      ),
    );
  }
}

class _ErrorStateWidget extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;
  const _ErrorStateWidget({required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return SafeArea(
      top: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(l10n.error(message)),
            const SizedBox(height: AppDimens.spaceL),
            ElevatedButton(onPressed: onRetry, child: Text(l10n.retry)),
          ],
        ),
      ),
    );
  }
}
