import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';
import '../../domain/enums/avatar_gender.dart';

extension AvatarGenderL10n on AvatarGender {
  String label(AppLocalizations l10n) => switch (this) {
    AvatarGender.men => l10n.male,
    AvatarGender.women => l10n.female,
  };
}
