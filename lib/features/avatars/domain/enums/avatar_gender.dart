import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';

enum AvatarGender { men, women }

extension AvatarGenderX on AvatarGender {
  String getLabel(AppLocalizations l10n) {
    switch (this) {
      case AvatarGender.men:
        return l10n.male;
      case AvatarGender.women:
        return l10n.female;
    }
  }

  String get label {
    switch (this) {
      case AvatarGender.men:
        return 'Male';
      case AvatarGender.women:
        return 'Female';
    }
  }
}
