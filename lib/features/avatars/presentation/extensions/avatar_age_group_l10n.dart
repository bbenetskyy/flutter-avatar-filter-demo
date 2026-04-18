import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';
import '../../domain/enums/avatar_age_group.dart';

extension AvatarAgeGroupL10n on AvatarAgeGroup {
  String nameLabel(AppLocalizations l10n) => switch (this) {
    AvatarAgeGroup.youngAdults => l10n.youngAdults,
    AvatarAgeGroup.adults => l10n.adults,
    AvatarAgeGroup.middleAgedAdults => l10n.middleAgedAdults,
    AvatarAgeGroup.olderAdults => l10n.olderAdults,
  };
}
