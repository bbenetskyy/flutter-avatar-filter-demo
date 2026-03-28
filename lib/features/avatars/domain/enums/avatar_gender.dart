enum AvatarGender { men, women }

extension AvatarGenderX on AvatarGender {
  String get label {
    switch (this) {
      case AvatarGender.men:
        return 'Men';
      case AvatarGender.women:
        return 'Women';
    }
  }
}
