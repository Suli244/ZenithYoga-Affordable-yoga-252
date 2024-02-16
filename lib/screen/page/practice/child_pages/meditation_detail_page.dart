import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/screen/page/meditation/models/meditation_model.dart';
import 'package:affordable_yoga_252/screen/page/practice/child_pages/meditation_start_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeditationDetailYogaPage extends StatelessWidget {
  const MeditationDetailYogaPage({super.key, required this.katalizator});
  final NoviceTabBar katalizator;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(katalizator.title),
        surfaceTintColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(13),
                child: CachedNetworkImage(
                  imageUrl: katalizator.mainImage,
                  fit: BoxFit.fitWidth,
                  placeholder: (context, url) =>
                      const Center(child: CupertinoActivityIndicator()),
                ),
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
            ...List.generate(katalizator.yogaPlans.length, (index) {
              final yoga = katalizator.yogaPlans[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MeditationStartYogaPage(
                        yoga,
                        mainImage: katalizator.mainImage,
                        group: katalizator.title,
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  width: MediaQuery.of(context).size.width,
                  height: 114,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(16).copyWith(bottom: 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            FittedBox(
                              child: Text(
                                '${index + 1}. ${yoga.title}',
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            Flexible(
                              child: Text(
                                yoga.desciption,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 4,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),
                      Image.asset(
                        AppImages.playIcon,
                        height: 37.h,
                        width: 37.w,
                      ),
                    ],
                  ),
                ),
              );
            }).toList()
            // ListView.separated(
            //   physics: const NeverScrollableScrollPhysics(),
            //   itemCount: katalizator.yogaPlans.length,
            //   separatorBuilder: (BuildContext context, int index) {
            //     return const SizedBox(height: 12);
            //   },
            //   itemBuilder: (BuildContext context, int index) {
            //     final yoga = katalizator.yogaPlans[index];
            //     return
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
