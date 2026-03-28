import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import '../../domain/entities/avatar.dart';
import '../../domain/enums/avatar_gender.dart';
import 'empty_state_widget.dart';

import 'package:flutter_avatar_filter_demo/style/app_dimens.dart';

class AvatarGrid extends StatelessWidget {
  final List<Avatar> avatars;
  final VoidCallback onClearFilters;
  const AvatarGrid({super.key, required this.avatars, required this.onClearFilters});

  @override
  Widget build(BuildContext context) {
    if (avatars.isEmpty) {
      return EmptyStateWidget(onClearFilters: onClearFilters);
    }

    final bottomPadding = Theme.of(context).platform == TargetPlatform.iOS
        ? MediaQuery.of(context).padding.bottom
        : AppDimens.padding_16;

    return GridView.builder(
      padding: EdgeInsets.fromLTRB(AppDimens.padding_20, AppDimens.padding_0, AppDimens.padding_20, bottomPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.75,
        crossAxisSpacing: AppDimens.spacing_8,
        mainAxisSpacing: AppDimens.spacing_8,
      ),
      itemCount: avatars.length,
      itemBuilder: (_, i) {
        final a = avatars[i];
        return Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppDimens.radius_8),
            side: BorderSide(
              color: AppColors.backgroundPrimary.withAlpha((255.0 * 0.05).round()),
              width: AppDimens.width_1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppDimens.radius_8),
            child: Stack(
              children: [
                Positioned.fill(child: Image.asset(a.imageUrl, fit: BoxFit.cover)),
                Positioned.fill(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(0, 0, 0, 0.0),
                          Color.fromRGBO(0, 0, 0, 0.12),
                          Color.fromRGBO(0, 0, 0, 0.35),
                          Color.fromRGBO(0, 0, 0, 0.68),
                        ],
                        stops: [0.52, 0.78, 0.9, 1.0],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(AppDimens.padding_8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          a.name,
                          style: Style.text14w600SecondaryStyle,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Row(
                          children: [
                            Text(a.gender.label, style: Style.text10NormalSecondaryAlpha80Style),
                            //todo separate widget??
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: AppDimens.padding_4),
                              child: Container(
                                width: AppDimens.width_1,
                                height: AppDimens.height_1,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: AppColors.textSecondaryAlpha80,
                                ),
                              ),
                            ),
                            Text(a.age.toString(), style: Style.text10NormalSecondaryAlpha80Style),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
