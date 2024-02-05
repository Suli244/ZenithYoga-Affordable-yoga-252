import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/screen/page/configuration/configuration_page.dart';
import 'package:affordable_yoga_252/screen/page/meditation/meditation_page.dart';
import 'package:affordable_yoga_252/screen/page/notes/notes_page.dart';
import 'package:affordable_yoga_252/screen/page/practice/practice_page.dart';
import 'package:affordable_yoga_252/screen/page/statistics/statistics_page.dart';
import 'package:flutter/material.dart';

class BottomNavigatorScreen extends StatefulWidget {
  const BottomNavigatorScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigatorScreen> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigatorScreen> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 15,
        selectedFontSize: 15,
        currentIndex: index,
        onTap: (indexFrom) async {
          setState(() {
            index = indexFrom;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.practiceIcon,
              width: 22.50,
              color: const Color(0xffD6D7E5),
            ),
            activeIcon: Image.asset(
              AppImages.practiceIcon,
              color: const Color(0xffA65EEF),
              width: 22.50,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.meditationIcon,
              width: 26.50,
              color: const Color(0xffD6D7E5),
            ),
            activeIcon: Image.asset(
              AppImages.meditationIcon,
              color: const Color(0xffA65EEF),
              width: 26.50,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.statisticsIcon,
              width: 28,
              color: const Color(0xffD6D7E5),
            ),
            activeIcon: Image.asset(
              AppImages.statisticsIcon,
              color: const Color(0xffA65EEF),
              width: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.notesIcon,
              width: 28,
              color: const Color(0xffD6D7E5),
            ),
            activeIcon: Image.asset(
              AppImages.notesIcon,
              color: const Color(0xffA65EEF),
              width: 28,
            ),
          ),
          BottomNavigationBarItem(
            label: '',
            icon: Image.asset(
              AppImages.configurationIcon,
              width: 28,
              color: const Color(0xffD6D7E5),
            ),
            activeIcon: Image.asset(
              AppImages.configurationIcon,
              color: const Color(0xffA65EEF),
              width: 28,
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> pages = [
  const PracticePage(),
  const MeditationPage(),
  const StatisticsPage(),
  const NotesPage(),
  const ConfigurationPage(),
];
