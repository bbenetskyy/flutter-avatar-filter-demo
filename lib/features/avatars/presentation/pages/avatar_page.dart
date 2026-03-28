import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:get/get.dart';
import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_age_group.dart';
import '../../domain/enums/avatar_pose.dart';
import '../controllers/avatar_controller.dart';
import '../widgets/avatar_grid.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/page_header.dart';

import 'package:flutter_avatar_filter_demo/style/app_dimens.dart';
import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ac = Get.find<AvatarController>();
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: Column(
        children: [
          Obx(
            () => PageHeader(
              title: l10n.allAvatars,
              onBackTap: () => Get.back(),
              anySelected: ac.hasActiveFilters,
              onResetTap: ac.clearFilters,
              chips: [
                HeaderFilterChip(
                  label: l10n.gender,
                  isActive: ac.selectedGenders.isNotEmpty,
                  count: ac.selectedGenders.length,
                  onTap: () => _showGenderFilter(context, ac, l10n),
                ),
                HeaderFilterChip(
                  label: l10n.age,
                  isActive: ac.selectedAgeGroups.isNotEmpty,
                  count: ac.selectedAgeGroups.length,
                  onTap: () => _showAgeFilter(context, ac, l10n),
                ),
                HeaderFilterChip(
                  label: l10n.pose,
                  isActive: ac.selectedPoses.isNotEmpty,
                  count: ac.selectedPoses.length,
                  onTap: () => _showPoseFilter(context, ac, l10n),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              final bottomPadding = Theme.of(context).platform == TargetPlatform.iOS
                  ? MediaQuery.of(context).padding.bottom
                  : AppDimens.padding_16;

              if (ac.isLoading.value) {
                return Padding(
                  padding: EdgeInsets.only(bottom: bottomPadding),
                  child: const Center(child: CircularProgressIndicator()),
                );
              }
              if (ac.errorMessage.isNotEmpty) {
                return Padding(
                  padding: EdgeInsets.only(bottom: bottomPadding),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(l10n.error(ac.errorMessage.value)),
                        const SizedBox(height: AppDimens.height_16),
                        ElevatedButton(onPressed: ac.reload, child: Text(l10n.retry)),
                      ],
                    ),
                  ),
                );
              }
              return AvatarGrid(avatars: ac.avatars.toList(), onClearFilters: ac.clearFilters);
            }),
          ),
        ],
      ),
    );
  }

  Future<void> _showGenderFilter(BuildContext context, AvatarController ac, AppLocalizations l10n) async {
    final genders = await FilterBottomSheet.show<AvatarGender>(
      context: context,
      title: l10n.gender,
      options: AvatarGender.values,
      initialValues: ac.selectedGenders,
      labelBuilder: (item) => Text(item.getLabel(l10n), style: Style.text14w600PrimaryStyle),
    );

    if (genders != null) {
      ac.updateGenderFilters(genders);
    }
  }

  Future<void> _showAgeFilter(BuildContext context, AvatarController ac, AppLocalizations l10n) async {
    final ages = await FilterBottomSheet.show<AvatarAgeGroup>(
      context: context,
      title: l10n.age,
      options: AvatarAgeGroup.values,
      initialValues: ac.selectedAgeGroups,
      labelBuilder: (item) => Text.rich(
        TextSpan(
          children: [
            TextSpan(text: item.getNameLabel(l10n), style: Style.text14w600PrimaryStyle),
            TextSpan(text: '\n${item.rangeLabel}', style: Style.text14NormalPrimaryStyle),
          ],
        ),
      ),
    );

    if (ages != null) {
      ac.updateAgeFilters(ages);
    }
  }

  Future<void> _showPoseFilter(BuildContext context, AvatarController ac, AppLocalizations l10n) async {
    final poses = await FilterBottomSheet.show<AvatarPose>(
      context: context,
      title: l10n.pose,
      options: AvatarPose.values,
      initialValues: ac.selectedPoses,
      labelBuilder: (item) => Text(item.getLabel(l10n), style: Style.text14w600PrimaryStyle),
    );

    if (poses != null) {
      ac.updatePoseFilters(poses);
    }
  }
}
