import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/screen/page/meditation/child_pages/meditation_complete_page.dart';
import 'package:affordable_yoga_252/screen/page/meditation/models/meditation_model.dart';
import 'package:flutter/material.dart';

class MeditationStartPage extends StatelessWidget {
  const MeditationStartPage(this.yoga,
      {super.key, required this.mainImage, required this.group});
  final YogaPlans yoga;
  final String mainImage;
  final String group;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MeditationCompletePage(
                yoga,
                mainImage: mainImage,
                group: group,
              ),
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
            padding: const EdgeInsets.all(16).copyWith(bottom: 150),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
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