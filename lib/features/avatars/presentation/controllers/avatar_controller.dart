import 'package:get/get.dart';
import '../../domain/entities/avatar.dart';
import '../../domain/enums/avatar_age_group.dart';
import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_pose.dart';
import '../../domain/usecases/get_and_filter_avatars_usecase.dart';

class AvatarController extends GetxController {
  final GetAndFilterAvatarsUseCase useCase;
  final avatars = <Avatar>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  AvatarController(this.useCase);

  @override
  void onInit() {
    super.onInit();
    _load();
  }

  void _load() async {
    try {
      isLoading.value = true;
      avatars.value = await useCase();
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void filter({List<AvatarGender>? genders, List<AvatarAgeGroup>? ageGroups, List<AvatarPose>? poses}) async {
    try {
      isLoading.value = true;
      avatars.value = await useCase(genders: genders, ageGroups: ageGroups, poses: poses);
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void reset() => _load();
}
