import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';
import '../../domain/enums/avatar_pose.dart';

extension AvatarPoseL10n on AvatarPose {
  String label(AppLocalizations l10n) => switch (this) {
    AvatarPose.standing => l10n.standing,
    AvatarPose.sitting => l10n.sitting,
    AvatarPose.selfie => l10n.selfie,
    AvatarPose.carSelfie => l10n.carSelfie,
    AvatarPose.walking => l10n.walking,
  };
}
