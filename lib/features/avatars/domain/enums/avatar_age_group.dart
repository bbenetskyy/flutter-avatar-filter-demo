enum AvatarAgeGroup { youngAdults, adults, middleAgedAdults, olderAdults }

extension AvatarAgeGroupX on AvatarAgeGroup {
  String get rangeLabel => switch (this) {
    AvatarAgeGroup.youngAdults => '18–24',
    AvatarAgeGroup.adults => '25–39',
    AvatarAgeGroup.middleAgedAdults => '40–64',
    AvatarAgeGroup.olderAdults => '65+',
  };
}

extension IntToAvatarAgeGroup on int {
  AvatarAgeGroup get ageGroup {
    if (this >= 18 && this <= 24) return AvatarAgeGroup.youngAdults;
    if (this >= 25 && this <= 39) return AvatarAgeGroup.adults;
    if (this >= 40 && this <= 64) return AvatarAgeGroup.middleAgedAdults;
    return AvatarAgeGroup.olderAdults;
  }
}
