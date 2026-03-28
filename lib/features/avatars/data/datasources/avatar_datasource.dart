import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_pose.dart';
import '../models/avatar_model.dart';

abstract class AvatarDataSource {
  Future<List<AvatarModel>> getAvatars();
}

class AvatarDataSourceImpl implements AvatarDataSource {
  @override
  Future<List<AvatarModel>> getAvatars() async {
    await Future.delayed(const Duration(milliseconds: 1500));
    return [
      for (int i = 1; i <= 50; i++)
        AvatarModel(
          id: i,
          name: 'Avatar $i',
          imageUrl: 'assets/avatars/avatar${(i % 3) + 1}.png',
          gender: i % 2 == 0 ? AvatarGender.men : AvatarGender.women,
          age: 20 + (i % 5),
          pose: AvatarPose.values[(i - 3) % AvatarPose.values.length],
        ),
    ];
  }
}
