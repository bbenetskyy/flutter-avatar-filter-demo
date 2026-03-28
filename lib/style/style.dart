import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class Style {
  static final whiteTheme = ThemeData(
    //todo fontFamily: 'use-demo-font',
    scaffoldBackgroundColor: AppColors.backgroundPrimary,
    appBarTheme: AppBarTheme(
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: AppColors.backgroundPrimary,
      foregroundColor: AppColors.textPrimary,
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        hoverColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
    ),
  );

  static final text26w700PrimaryStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    //todo fontFamily: 'Bold',
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static final text22w700PrimaryStyle = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w700,
    //todo fontFamily: 'Bold',
    height: 1.2,
    color: AppColors.textPrimary,
  );

  static final text16w600SecondaryStyle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    //todo fontFamily: 'Demibold',
    color: AppColors.textSecondary,
  );

  static final text16w600PrimaryStyle = text16w600SecondaryStyle.copyWith(
    //todo fontFamily: 'Demibold',
    height: 1.35,
    color: AppColors.textPrimary,
  );

  static final text14w600SecondaryStyle = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    //todo fontFamily: 'Demibold',
    height: 1.2,
    color: AppColors.textSecondary,
  );

  static final text14w600PrimaryStyle = text14w600SecondaryStyle.copyWith(color: AppColors.textPrimary, height: 1.1);

  static final text12w600PrimaryStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    //todo fontFamily: 'Demibold',
    color: AppColors.textPrimary,
  );

  static final text12w700SecondaryStyle = text12w600PrimaryStyle.copyWith(
    fontWeight: FontWeight.w700,
    height: 1.4,
    //todo fontFamily: 'Bold',
    color: AppColors.textSecondary,
  );

  static final text10NormalSecondaryStyle = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );
}
