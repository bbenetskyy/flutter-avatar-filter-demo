import 'package:get/get.dart';
import '../../domain/entities/avatar.dart';
import '../../domain/enums/avatar_age_group.dart';
import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_pose.dart';
import '../../domain/usecases/get_avatars_usecase.dart';

class AvatarController extends GetxController {
  final GetAvatarsUseCase useCase;

  final allAvatars = <Avatar>[];
  final avatars = <Avatar>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  final selectedGenders = <AvatarGender>[].obs;
  final selectedAgeGroups = <AvatarAgeGroup>[].obs;
  final selectedPoses = <AvatarPose>[].obs;

  AvatarController(this.useCase);

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() async {
    try {
      isLoading.value = true;
      final result = await useCase();
      allAvatars.assignAll(result);
      _applyLocalFilters();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void _applyLocalFilters() {
    final filtered = allAvatars.where((avatar) {
      if (selectedGenders.isNotEmpty && !selectedGenders.contains(avatar.gender)) {
        return false;
      }
      if (selectedAgeGroups.isNotEmpty && !selectedAgeGroups.contains(avatar.age.ageGroup)) {
        return false;
      }
      if (selectedPoses.isNotEmpty && !selectedPoses.contains(avatar.pose)) {
        return false;
      }
      return true;
    }).toList();
    avatars.assignAll(filtered);
  }

  void updateGenderFilters(List<AvatarGender> genders) {
    selectedGenders.assignAll(genders);
    _applyLocalFilters();
  }

  void updateAgeFilters(List<AvatarAgeGroup> ageGroups) {
    selectedAgeGroups.assignAll(ageGroups);
    _applyLocalFilters();
  }

  void updatePoseFilters(List<AvatarPose> poses) {
    selectedPoses.assignAll(poses);
    _applyLocalFilters();
  }

  void clearFilters() {
    selectedGenders.clear();
    selectedAgeGroups.clear();
    selectedPoses.clear();
    _applyLocalFilters();
  }

  bool get hasActiveFilters => selectedGenders.isNotEmpty || selectedAgeGroups.isNotEmpty || selectedPoses.isNotEmpty;

  void reload() => _load();
}
