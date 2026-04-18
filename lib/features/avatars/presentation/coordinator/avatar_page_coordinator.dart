import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import '../../domain/enums/avatar_age_group.dart';
import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_pose.dart';
import '../controllers/avatar_filter_controller.dart';
import '../extensions/avatar_age_group_l10n.dart';
import '../extensions/avatar_gender_l10n.dart';
import '../extensions/avatar_pose_l10n.dart';
import '../widgets/filter_bottom_sheet.dart';

class AvatarPageCoordinator {
  final AvatarFilterController _filter;
  const AvatarPageCoordinator(this._filter);

  void goBack() => Get.back();

  Future<void> showGenderFilter(BuildContext context, AppLocalizations l10n) async {
    final result = await FilterBottomSheet.show<AvatarGender>(
      context: context,
      title: l10n.gender,
      options: AvatarGender.values,
      initialValues: _filter.selectedGenders,
      labelBuilder: (item) => Text(item.label(l10n), style: Style.text14w600PrimaryStyle),
    );
    if (result != null) _filter.updateGenderFilters(result);
  }

  Future<void> showAgeFilter(BuildContext context, AppLocalizations l10n) async {
    final result = await FilterBottomSheet.show<AvatarAgeGroup>(
      context: context,
      title: l10n.age,
      options: AvatarAgeGroup.values,
      initialValues: _filter.selectedAgeGroups,
      labelBuilder: (item) => Text.rich(
        TextSpan(
          children: [
            TextSpan(text: item.nameLabel(l10n), style: Style.text14w600PrimaryStyle),
            TextSpan(text: '\n${item.rangeLabel}', style: Style.text14NormalPrimaryStyle),
          ],
        ),
      ),
    );
    if (result != null) _filter.updateAgeFilters(result);
  }

  Future<void> showPoseFilter(BuildContext context, AppLocalizations l10n) async {
    final result = await FilterBottomSheet.show<AvatarPose>(
      context: context,
      title: l10n.pose,
      options: AvatarPose.values,
      initialValues: _filter.selectedPoses,
      labelBuilder: (item) => Text(item.label(l10n), style: Style.text14w600PrimaryStyle),
    );
    if (result != null) _filter.updatePoseFilters(result);
  }
}
