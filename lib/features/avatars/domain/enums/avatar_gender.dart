enum AvatarGender { men, women }

extension AvatarGenderX on AvatarGender {
  String get label {
    switch (this) {
      case AvatarGender.men:
        return 'Male';
      case AvatarGender.women:
        return 'Female';
    }
  }
}
