import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/screen/page/meditation/child_pages/meditation_complete_page.dart';
import 'package:flutter/material.dart';

class MeditationStartPage extends StatelessWidget {
  const MeditationStartPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MeditationCompletePage(),
            ),
          );
        },
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
            'Start',
            style: TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 400,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: <Widget>[
                  Image.asset(
                    AppImages.yogaOne,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  const Text(
                    'Welcome to Wellness',
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '30 minutes',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    '''Introduce new practitioners to the foundational concepts of yoga, emphasizing the connection between mind, body, and breath, and setting the stage for a transformative wellness journey.

Introduction (5 minutes):
Greetings and a brief overview of the course.
Discussion on the holistic benefits of yoga for stress relief and overall health.
Explanation of what to expect in the coming lessons.
Understanding Yoga (5 minutes):
A concise history and philosophy of yoga to give context to the practice.
Explanation of the eight limbs of yoga, with a focus on the Yamas and Niyamas, which guide the ethical and moral foundations.
Breath Awareness (5 minutes):
Introduction to Pranayama (yogic breathing).
Guided practice on observing the natural breath.
Techniques to deepen and slow down the breath, establishing a rhythmic pattern.''',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}



// Container(
//               height: 56,
//               margin: const EdgeInsets.only(bottom: 45, right: 16, left: 16),
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: const Color(0xffA65EEF),
//               ),
//             ),