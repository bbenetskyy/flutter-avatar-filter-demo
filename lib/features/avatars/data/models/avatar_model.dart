import '../../domain/entities/avatar.dart';
import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_pose.dart';

class AvatarModel extends Avatar {
  const AvatarModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.gender,
    required super.age,
    required super.pose,
  });

  factory AvatarModel.fromJson(Map<String, dynamic> json) {
    return AvatarModel(
      id: json['id'] as int,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      gender: AvatarGender.values.firstWhere((e) => e.name == json['gender']),
      age: json['age'] as int,
      pose: AvatarPose.values.firstWhere((e) => e.name == json['pose']),
    );
  }

  Avatar toEntity() {
    return Avatar(id: id, name: name, imageUrl: imageUrl, gender: gender, age: age, pose: pose);
  }
}
