import 'package:flutter/material.dart';
import '../../domain/entities/avatar.dart';
import 'avatar_card.dart';
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

    final bottomPadding = MediaQuery.paddingOf(context).bottom + AppDimens.spaceL;

    return GridView.builder(
      padding: EdgeInsets.fromLTRB(AppDimens.gridPadH, 0, AppDimens.gridPadH, bottomPadding),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.75,
        crossAxisSpacing: AppDimens.gridGap,
        mainAxisSpacing: AppDimens.gridGap,
      ),
      itemCount: avatars.length,
      itemBuilder: (_, i) => AvatarCard(avatar: avatars[i]),
    );
  }
}
