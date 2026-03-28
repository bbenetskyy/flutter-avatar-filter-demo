import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';

enum AvatarAgeGroup { youngAdults, adults, middleAgedAdults, olderAdults }

extension AvatarAgeGroupX on AvatarAgeGroup {
  String getNameLabel(AppLocalizations l10n) {
    switch (this) {
      case AvatarAgeGroup.youngAdults:
        return l10n.youngAdults;
      case AvatarAgeGroup.adults:
        return l10n.adults;
      case AvatarAgeGroup.middleAgedAdults:
        return l10n.middleAgedAdults;
      case AvatarAgeGroup.olderAdults:
        return l10n.olderAdults;
    }
  }

  String get nameLabel {
    switch (this) {
      case AvatarAgeGroup.youngAdults:
        return 'Young adults';
      case AvatarAgeGroup.adults:
        return 'Adults';
      case AvatarAgeGroup.middleAgedAdults:
        return 'Middle-aged adults';
      case AvatarAgeGroup.olderAdults:
        return 'Older adults';
    }
  }

  String get rangeLabel {
    switch (this) {
      case AvatarAgeGroup.youngAdults:
        return '18-24';
      case AvatarAgeGroup.adults:
        return '25-39';
      case AvatarAgeGroup.middleAgedAdults:
        return '40-64';
      case AvatarAgeGroup.olderAdults:
        return '65+';
    }
  }

  String get label {
    return '$nameLabel\n$rangeLabel';
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
