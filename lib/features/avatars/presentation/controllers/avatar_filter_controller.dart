import 'package:get/get.dart';
import '../../domain/entities/avatar.dart';
import '../../domain/enums/avatar_age_group.dart';
import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_pose.dart';
import 'avatar_loader_controller.dart';

class AvatarFilterController extends GetxController {
  final AvatarLoaderController _loader;
  AvatarFilterController(this._loader);

  final _selectedGenders = <AvatarGender>[].obs;
  final _selectedAgeGroups = <AvatarAgeGroup>[].obs;
  final _selectedPoses = <AvatarPose>[].obs;
  final _filteredAvatars = <Avatar>[].obs;

  RxList<AvatarGender> get selectedGenders => _selectedGenders;
  RxList<AvatarAgeGroup> get selectedAgeGroups => _selectedAgeGroups;
  RxList<AvatarPose> get selectedPoses => _selectedPoses;
  RxList<Avatar> get filteredAvatars => _filteredAvatars;

  bool get hasActiveFilters =>
      _selectedGenders.isNotEmpty ||
      _selectedAgeGroups.isNotEmpty ||
      _selectedPoses.isNotEmpty;

  @override
  void onInit() {
    super.onInit();
    ever(_loader.allAvatars, (_) => _recompute());
  }

  void updateGenderFilters(List<AvatarGender> genders) {
    _selectedGenders.assignAll(genders);
    _recompute();
  }

  void updateAgeFilters(List<AvatarAgeGroup> ageGroups) {
    _selectedAgeGroups.assignAll(ageGroups);
    _recompute();
  }

  void updatePoseFilters(List<AvatarPose> poses) {
    _selectedPoses.assignAll(poses);
    _recompute();
  }

  void clearFilters() {
    _selectedGenders.clear();
    _selectedAgeGroups.clear();
    _selectedPoses.clear();
    _recompute();
  }

  void _recompute() {
    _filteredAvatars.assignAll(_loader.allAvatars.where(_passes));
  }

  bool _passes(Avatar a) =>
      (_selectedGenders.isEmpty || _selectedGenders.contains(a.gender)) &&
      (_selectedAgeGroups.isEmpty || _selectedAgeGroups.contains(a.age.ageGroup)) &&
      (_selectedPoses.isEmpty || _selectedPoses.contains(a.pose));
}
