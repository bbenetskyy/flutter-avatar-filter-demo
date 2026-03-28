import 'package:flutter/material.dart';
import 'package:flutter_avatar_filter_demo/style/app_colors.dart';
import 'package:flutter_avatar_filter_demo/style/style.dart';
import 'package:get/get.dart';
import '../controllers/filter_controller.dart';
import '../controllers/avatar_controller.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/empty.png', width: 165, height: 165, fit: BoxFit.contain),
            Text(
              'Nothing was found using these filters',
              textAlign: TextAlign.center,
              style: Style.text26w700PrimaryStyle.copyWith(fontSize: 24),
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: 180,
              height: 60,
              child: OutlinedButton(
                onPressed: () {
                  Get.find<FilterController>().resetAll();
                  Get.find<AvatarController>().reset();
                },
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.borderDefault),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: Text('Clear filters', style: Style.text16w600PrimaryStyle.copyWith(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
