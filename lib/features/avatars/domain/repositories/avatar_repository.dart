import '../entities/avatar.dart';
import '../enums/avatar_age_group.dart';
import '../enums/avatar_gender.dart';
import '../enums/avatar_pose.dart';

abstract class AvatarRepository {
  Future<List<Avatar>> getAndFilterAvatars({
    List<AvatarGender>? genders,
    List<AvatarAgeGroup>? ageGroups,
    List<AvatarPose>? poses,
  });
}
