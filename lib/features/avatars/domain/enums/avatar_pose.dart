enum AvatarPose { standing, sitting, selfie, carSelfie, walking }

extension AvatarPoseX on AvatarPose {
  String get label {
    switch (this) {
      case AvatarPose.standing:
        return 'Standing';
      case AvatarPose.sitting:
        return 'Sitting';
      case AvatarPose.selfie:
        return 'Selfie';
      case AvatarPose.carSelfie:
        return 'Car selfie';
      case AvatarPose.walking:
        return 'Walking';
    }
  }
}
