import 'package:affordable_yoga_252/MODELS/noter_model.dart';
import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:affordable_yoga_252/screen/page/meditation/note_pages/new_note_page.dart';
import 'package:flutter/material.dart';

class MeditationDonePage extends StatelessWidget {
  const MeditationDonePage({
    super.key,
    required this.mainImage,
    required this.group,
  });
  final String mainImage;
  final String group;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          BirSerseTap(
            title: 'Add Note',
            color: const Color(0xffA65EEF),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewNotePage(
                    noteType: NoteType.Meditation,
                    mainImage: mainImage,
                    group: group,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 12),
          BirSerseTap(
            title: 'Go Home',
            color: const Color(0xffE489EC),
            onTap: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => const BottomNavigatorScreen(
                    currentIndex: 1,
                  ),
                ),
                (route) => false,
              );
            },
          ),
        ],
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
                    AppImages.yogaTrhee,
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
                    'Meditation Complete!',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    '''You've honored your well-being today with dedication and strength—carry this sense of accomplishment with you, knowing that every session enriches your journey to inner peace and vitality. Keep shining! 🌟''',
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

class BirSerseTap extends StatelessWidget {
  const BirSerseTap({
    Key? key,
    required this.onTap,
    required this.title,
    required this.color,
  }) : super(key: key);

  final VoidCallback onTap;
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 56,
        margin: const EdgeInsets.only(right: 16, left: 16),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        alignment: Alignment.center,
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
