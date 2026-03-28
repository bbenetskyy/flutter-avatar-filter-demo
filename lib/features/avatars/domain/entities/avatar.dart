import '../enums/avatar_gender.dart';
import '../enums/avatar_pose.dart';

class Avatar {
  final int id;
  final String name;
  final String imageUrl;
  final AvatarGender gender;
  final int age;
  final AvatarPose pose;

  const Avatar({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.gender,
    required this.age,
    required this.pose,
  });
}
