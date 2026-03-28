import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import '../../domain/entities/avatar.dart';
import '../../domain/enums/avatar_gender.dart';
import '../../domain/enums/avatar_pose.dart';
import 'empty_state_widget.dart';

class AvatarGrid extends StatelessWidget {
  final List<Avatar> avatars;
  const AvatarGrid({super.key, required this.avatars});

  @override
  Widget build(BuildContext context) {
    if (avatars.isEmpty) {
      return const EmptyStateWidget();
    }

    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.75,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: avatars.length,
      itemBuilder: (_, i) {
        final a = avatars[i];
        return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: AppColors.borderDefault,
                  child: const Icon(Icons.image, size: 50, color: AppColors.textAdditional),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(a.name, style: Style.text14w600PrimaryStyle, maxLines: 1, overflow: TextOverflow.ellipsis),
                    Text(a.gender.label, style: Style.text12w600PrimaryStyle.copyWith(color: AppColors.textAdditional)),
                    Text(a.pose.label, style: Style.text12w600PrimaryStyle.copyWith(color: AppColors.textAdditional)),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
