// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get save => 'Save';

  @override
  String get allAvatars => 'All avatars';

  @override
  String get gender => 'Gender';

  @override
  String get age => 'Age';

  @override
  String get pose => 'Pose';

  @override
  String error(String message) {
    return 'Error: $message';
  }

  @override
  String get retry => 'Retry';

  @override
  String get nothingFound => 'Nothing was found using these filters';

  @override
  String get clearFilters => 'Clear filters';

  @override
  String get male => 'Male';

  @override
  String get female => 'Female';

  @override
  String get youngAdults => 'Young adults';

  @override
  String get adults => 'Adults';

  @override
  String get middleAgedAdults => 'Middle-aged adults';

  @override
  String get olderAdults => 'Older adults';

  @override
  String get standing => 'Standing';

  @override
  String get sitting => 'Sitting';

  @override
  String get selfie => 'Selfie';

  @override
  String get carSelfie => 'Car selfie';

  @override
  String get walking => 'Walking';
}
