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
  Future<List<Avatar>> getAndFilterAvatars({AvatarGender? gender, AvatarAgeGroup? ageGroup, AvatarPose? pose}) async {
    final all = await dataSource.getAvatars();
    return all
        .where((a) {
          if (gender != null && a.gender != gender) return false;
          if (ageGroup != null && a.age.ageGroup != ageGroup) return false;
          if (pose != null && a.pose != pose) return false;
          return true;
        })
        .map((m) => m.toEntity())
        .toList();
  }
}
