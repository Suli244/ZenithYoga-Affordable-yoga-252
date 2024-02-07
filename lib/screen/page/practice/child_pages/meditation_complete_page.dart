import 'package:affordable_yoga_252/screen/page/meditation/models/meditation_model.dart';
import 'package:affordable_yoga_252/screen/page/practice/child_pages/meditation_done_page.dart';
import 'package:flutter/material.dart';

class MeditationCompleteYogaPage extends StatelessWidget {
  const MeditationCompleteYogaPage(this.yoga, {super.key});
  final YogaPlans yoga;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MeditationDoneYogaPage(),
          ),
        ),
        child: Container(
          height: 56,
          margin: const EdgeInsets.only(right: 16, left: 16),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: const Color(0xffA65EEF),
          ),
          alignment: Alignment.center,
          child: const Text(
            'Complete',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20)
            .copyWith(bottom: 150),
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              yoga.title,
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '${yoga.min} minutes',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              yoga.desciption,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
