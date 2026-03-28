import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:get/get.dart';
import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_age_group.dart';
import '../../domain/enums/avatar_pose.dart';
import '../controllers/avatar_controller.dart';
import '../controllers/filter_controller.dart';
import '../widgets/avatar_grid.dart';
import '../widgets/filter_bottom_sheet.dart';
import '../widgets/page_header.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ac = Get.find<AvatarController>();
    final fc = Get.find<FilterController>();

    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: Column(
        children: [
          Obx(
            () => PageHeader(
              title: 'All avatars',
              onBackTap: () => Get.back(),
              anySelected: fc.hasActive,
              onResetTap: () {
                fc.resetAll();
                ac.reset();
              },
              chips: [
                HeaderFilterChip(
                  label: 'Gender',
                  isActive: fc.selectedGenders.isNotEmpty,
                  count: fc.selectedGenders.length,
                  onTap: () => _showGenderFilter(context, fc, ac),
                ),
                HeaderFilterChip(
                  label: 'Age',
                  isActive: fc.selectedAgeGroups.isNotEmpty,
                  count: fc.selectedAgeGroups.length,
                  onTap: () => _showAgeFilter(context, fc, ac),
                ),
                HeaderFilterChip(
                  label: 'Pose',
                  isActive: fc.selectedPoses.isNotEmpty,
                  count: fc.selectedPoses.length,
                  onTap: () => _showPoseFilter(context, fc, ac),
                ),
              ],
            ),
          ),
          Expanded(
            child: Obx(() {
              if (ac.isLoading.value) {
                return const Center(child: CircularProgressIndicator());
              }
              if (ac.errorMessage.isNotEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Error: ${ac.errorMessage.value}'),
                      const SizedBox(height: 16),
                      ElevatedButton(onPressed: ac.reset, child: const Text('Retry')),
                    ],
                  ),
                );
              }
              return AvatarGrid(avatars: ac.avatars);
            }),
          ),
        ],
      ),
    );
  }

  Future<void> _showGenderFilter(BuildContext context, FilterController fc, AvatarController ac) async {
    final genders = await FilterBottomSheet.show<AvatarGender>(
      context: context,
      title: 'Gender',
      options: AvatarGender.values,
      initialValues: fc.selectedGenders,
      labelBuilder: (item) => item.label,
    );

    if (genders != null) {
      fc.setGenders(genders);
      ac.filter(genders: fc.selectedGenders, ageGroups: fc.selectedAgeGroups, poses: fc.selectedPoses);
    }
  }

  Future<void> _showAgeFilter(BuildContext context, FilterController fc, AvatarController ac) async {
    final ages = await FilterBottomSheet.show<AvatarAgeGroup>(
      context: context,
      title: 'Age',
      options: AvatarAgeGroup.values,
      initialValues: fc.selectedAgeGroups,
      labelBuilder: (item) => item.label,
    );

    if (ages != null) {
      fc.setAgeGroups(ages);
      ac.filter(genders: fc.selectedGenders, ageGroups: fc.selectedAgeGroups, poses: fc.selectedPoses);
    }
  }

  Future<void> _showPoseFilter(BuildContext context, FilterController fc, AvatarController ac) async {
    final poses = await FilterBottomSheet.show<AvatarPose>(
      context: context,
      title: 'Pose',
      options: AvatarPose.values,
      initialValues: fc.selectedPoses,
      labelBuilder: (item) => item.label,
    );

    if (poses != null) {
      fc.setPoses(poses);
      ac.filter(genders: fc.selectedGenders, ageGroups: fc.selectedAgeGroups, poses: fc.selectedPoses);
    }
  }
}
