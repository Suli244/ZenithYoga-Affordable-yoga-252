import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/core/premi/open.dart';
import 'package:affordable_yoga_252/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:affordable_yoga_252/screen/introduction_process/widget/button_widget.dart';
import 'package:affordable_yoga_252/screen/introduction_process/widget/introduction_process_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IntroductionProcessScreen extends StatefulWidget {
  const IntroductionProcessScreen({super.key});
  @override
  State<IntroductionProcessScreen> createState() =>
      _IntroductionProcessScreenState();
}

class _IntroductionProcessScreenState extends State<IntroductionProcessScreen> {
  final PageController controller = PageController();
  int currantPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              physics: const ClampingScrollPhysics(),
              controller: controller,
              onPageChanged: (value) {
                setState(() {
                  currantPage = value;
                });
              },
              children: [
                IntroductionProcessItemWidget(
                  imageOnBoar: AppImages.onboardingOne,
                  titleOnBoar: 'Welcome to\nZenithYoga!',
                  titleTwoOnBoar:
                      'Begin your journey towards a more peaceful and\nhealthier lifestyle with personalized yoga and\nmeditation sessions.',
                  sizTwo: 22.h,
                  siz: 22.h,
                ),
                const IntroductionProcessItemWidget(
                  imageOnBoar: AppImages.onboardingTwo,
                  titleOnBoar: 'Tailored for You',
                  titleTwoOnBoar:
                      'Customize your yoga and meditation plans to fit\nyour goals, whether it\'s for relaxation, flexibility, or\nstrength building.',
                ),
                IntroductionProcessItemWidget(
                  imageOnBoar: AppImages.onboradingTrhee,
                  titleOnBoar: 'Track and Grow',
                  titleTwoOnBoar:
                      'Monitor your progress and deepen your practice\nwith our intuitive progress trackers and regular\nmindfulness reminders.',
                  siz: 22.h,
                  sizTwo: 22.h,
                ),
              ],
            ),
          ),
          SizedBox(height: 24.h),
          SmoothPageIndicator(
            controller: controller,
            count: 3,
            effect: const ExpandingDotsEffect(
              activeDotColor: Color(0xffA65EEF),
              dotColor: Color(0xffD6D7E5),
              dotHeight: 7,
              dotWidth: 7,
            ),
          ),
          SizedBox(height: 24.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ButtonWidget(
              color: const Color(0xffA65EEF),
              onPress: () async {
                if (currantPage == 2) {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BottomNavigatorScreen(),
                    ),
                    (protected) => false,
                  );
                  // await OpenAffordableYoga.setFirstOpen();
                } else {
                  controller.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                }
              },
              text: currantPage == 0
                  ? 'Let’s Go!'
                  : currantPage == 2
                      ? 'Start now'
                      : 'Next',
              radius: 12,
              height: 60.h,
            ),
          ),
          SizedBox(height: 45.h),
        ],
      ),
    );
  }
}
