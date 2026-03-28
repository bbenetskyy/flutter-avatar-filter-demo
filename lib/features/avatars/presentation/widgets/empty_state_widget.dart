import 'package:flutter/material.dart';
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
            const Text(
              'Nothing was found using these filters',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Colors.black),
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
                  side: const BorderSide(color: Color(0xFFF2F2F2)),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text(
                  'Clear filters',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
