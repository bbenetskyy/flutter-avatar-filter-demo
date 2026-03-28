import '../../domain/entities/avatar.dart';
import '../../domain/enums/avatar_age_group.dart';
import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_pose.dart';
import '../../domain/repositories/avatar_repository.dart';
import '../datasources/avatar_datasource.dart';

class AvatarRepositoryImpl implements AvatarRepository {
  final AvatarDataSource dataSource;
  AvatarRepositoryImpl(this.dataSource);

  @override
  Future<List<Avatar>> getAndFilterAvatars({
    List<AvatarGender>? genders,
    List<AvatarAgeGroup>? ageGroups,
    List<AvatarPose>? poses,
  }) async {
    final all = await dataSource.getAvatars();
    return all
        .where((a) {
          if (genders != null && genders.isNotEmpty && !genders.contains(a.gender)) return false;
          if (ageGroups != null && ageGroups.isNotEmpty && !ageGroups.contains(a.age.ageGroup)) return false;
          if (poses != null && poses.isNotEmpty && !poses.contains(a.pose)) return false;
          return true;
        })
        .map((m) => m.toEntity())
        .toList();
  }
}
