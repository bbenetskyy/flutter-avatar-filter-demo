import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/l10n/app_localizations.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/app_dimens.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import '../../domain/entities/avatar.dart';
import '../extensions/avatar_gender_l10n.dart';

class AvatarCard extends StatelessWidget {
  final Avatar avatar;
  const AvatarCard({super.key, required this.avatar});

  static const _borderRadius = BorderRadius.all(Radius.circular(AppDimens.radiusS));

  static const _shape = RoundedRectangleBorder(
    borderRadius: _borderRadius,
    side: BorderSide(color: AppColors.cardBorderColor, width: AppDimens.borderThin),
  );

  static const _gradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Color(0x00000000),
      Color(0x1F000000),
      Color(0x59000000),
      Color(0xAD000000),
    ],
    stops: [0.52, 0.78, 0.9, 1.0],
  );

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Card(
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      shape: _shape,
      child: Stack(
        children: [
          Positioned.fill(child: Image.asset(avatar.imageUrl, fit: BoxFit.cover)),
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(gradient: _gradient),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(AppDimens.spaceS),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    avatar.name,
                    style: Style.text14w600SecondaryStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Row(
                    children: [
                      Text(avatar.gender.label(l10n), style: Style.text10NormalSecondaryAlpha80Style),
                      const _DotSeparator(),
                      Text(avatar.age.toString(), style: Style.text10NormalSecondaryAlpha80Style),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DotSeparator extends StatelessWidget {
  const _DotSeparator();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppDimens.spaceXS),
      child: const DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.textSecondaryAlpha80,
        ),
        child: SizedBox(width: AppDimens.borderThin, height: AppDimens.borderThin),
      ),
    );
  }
}
