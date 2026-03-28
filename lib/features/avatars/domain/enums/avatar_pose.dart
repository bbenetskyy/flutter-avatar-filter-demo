import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';

enum AvatarPose { standing, sitting, selfie, carSelfie, walking }

extension AvatarPoseX on AvatarPose {
  String getLabel(AppLocalizations l10n) {
    switch (this) {
      case AvatarPose.standing:
        return l10n.standing;
      case AvatarPose.sitting:
        return l10n.sitting;
      case AvatarPose.selfie:
        return l10n.selfie;
      case AvatarPose.carSelfie:
        return l10n.carSelfie;
      case AvatarPose.walking:
        return l10n.walking;
    }
  }

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
