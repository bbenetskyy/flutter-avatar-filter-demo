import '../entities/avatar.dart';
import '../enums/avatar_age_group.dart';
import '../enums/avatar_gender.dart';
import '../enums/avatar_pose.dart';
import '../repositories/avatar_repository.dart';

class GetAndFilterAvatarsUseCase {
  final AvatarRepository repository;
  GetAndFilterAvatarsUseCase(this.repository);

  Future<List<Avatar>> call({List<AvatarGender>? genders, List<AvatarAgeGroup>? ageGroups, List<AvatarPose>? poses}) =>
      repository.getAndFilterAvatars(genders: genders, ageGroups: ageGroups, poses: poses);
}
