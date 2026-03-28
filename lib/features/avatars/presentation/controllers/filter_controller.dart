import 'package:get/get.dart';

import '../../domain/enums/avatar_age_group.dart';
import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_pose.dart';

class FilterController extends GetxController {
  final selectedGenders = <AvatarGender>[].obs;
  final selectedAgeGroups = <AvatarAgeGroup>[].obs;
  final selectedPoses = <AvatarPose>[].obs;

  void setGenders(List<AvatarGender> gs) => selectedGenders.value = gs;
  void setAgeGroups(List<AvatarAgeGroup> ags) => selectedAgeGroups.value = ags;
  void setPoses(List<AvatarPose> ps) => selectedPoses.value = ps;

  void resetAll() {
    selectedGenders.clear();
    selectedAgeGroups.clear();
    selectedPoses.clear();
  }

  bool get hasActive => selectedGenders.isNotEmpty || selectedAgeGroups.isNotEmpty || selectedPoses.isNotEmpty;
}
