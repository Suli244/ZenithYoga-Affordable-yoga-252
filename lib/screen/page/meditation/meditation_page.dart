import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/screen/page/meditation/child_pages/meditation_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final category = ['Novice', 'Amateur', 'Professional'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text(
                'Yoga',
                style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 24),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  suffixIcon: Image.asset(
                    AppImages.searchIcon,
                    scale: 3,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Select Category',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(height: 12),
              Row(
                children: category
                    .map(
                      (txt) => CategoryButton(
                        label: txt,
                        selected: txt == 'Novice',
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MeditationDetailPage(),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.white,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.yogaOne,
                        height: 81,
                        width: 81,
                      ),
                      const SizedBox(width: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Serenity Stretch',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          const Text(
                            '10 Lessons',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.label,
    required this.selected,
  });
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: selected ? const Color(0xffA65EEF) : Colors.white,
      ),
      margin: const EdgeInsets.only(right: 8),
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: selected ? Colors.white : Colors.black,
        ),
      ),
    );
  }
}
