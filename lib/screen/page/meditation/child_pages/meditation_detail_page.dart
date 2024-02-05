import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/screen/page/meditation/child_pages/meditation_start_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeditationDetailPage extends StatelessWidget {
  const MeditationDetailPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MeditationDetailPage'),
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(13),
              child: Image.asset(
                AppImages.yogaOne,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'A course designed to introduce beginners to the calming effects of yoga. It includes simple stretching exercises, basic asanas, and relaxation techniques to relieve stress.',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Lessons',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MeditationStartPage()),
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 114,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    FittedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          FittedBox(
                            child: Text(
                              '1. Welcome to Wellness',
                              style: TextStyle(
                                fontSize: 15.h,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 8.h),
                          FittedBox(
                            child: Text(
                              'Begin your journey with an introduction\nto the basic principles of yoga,\nunderstanding the importance of breath\nand gentle movement to establish a foundation for wellness.,',
                              style: TextStyle(
                                fontSize: 12.h,
                                fontWeight: FontWeight.w500,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Image.asset(
                        AppImages.playIcon,
                        height: 37.h,
                        width: 37.w,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
