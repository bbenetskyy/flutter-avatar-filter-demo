enum AvatarAgeGroup { youngAdults, adults, middleAgedAdults, olderAdults }

extension AvatarAgeGroupX on AvatarAgeGroup {
  String get label {
    switch (this) {
      case AvatarAgeGroup.youngAdults:
        return 'Young adults\n18-24';
      case AvatarAgeGroup.adults:
        return 'Adults\n25-39';
      case AvatarAgeGroup.middleAgedAdults:
        return 'Middle-aged adults\n40-64';
      case AvatarAgeGroup.olderAdults:
        return 'Older adults\n65+';
    }
  }
}

extension IntToAvatarAgeGroup on int {
  AvatarAgeGroup get ageGroup {
    if (this >= 18 && this <= 24) return AvatarAgeGroup.youngAdults;
    if (this >= 25 && this <= 39) return AvatarAgeGroup.adults;
    if (this >= 40 && this <= 64) return AvatarAgeGroup.middleAgedAdults;
    return AvatarAgeGroup.olderAdults;
  }
}
