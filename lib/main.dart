import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:get/get.dart';
import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';

import 'features/avatars/presentation/bindings/avatar_bindings.dart';
import 'features/avatars/presentation/pages/avatar_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: Style.whiteTheme,
      debugShowCheckedModeBanner: false,
      title: 'Avatar Browser',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: const AvatarPage(),
      initialBinding: AvatarBindings(),
    );
  }
}
