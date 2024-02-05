import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/core/premi/premi.dart';
import 'package:affordable_yoga_252/core/urls.dart';
import 'package:affordable_yoga_252/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:affordable_yoga_252/screen/exclusive/widget/rest_widgets.dart';
import 'package:affordable_yoga_252/screen/introduction_process/widget/button_widget.dart';
import 'package:affordable_yoga_252/screen/page/configuration/widget/web_view_insightful_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ExclusiveScreen extends StatefulWidget {
  const ExclusiveScreen({super.key, this.isClose = false});

  final bool isClose;

  @override
  State<ExclusiveScreen> createState() => _ExclusiveScreenState();
}

class _ExclusiveScreenState extends State<ExclusiveScreen> {
  bool toLoad = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5.h),
            Row(
              children: [
                SizedBox(width: 16.w),
                const Text(
                  'PREMIUM',
                  style: TextStyle(
                    fontFamily: 'mp',
                    fontSize: 34,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff0D0F45),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () async {
                    if (widget.isClose) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNavigatorScreen(),
                        ),
                        (protected) => false,
                      );
                    }
                  },
                  child: Image.asset(
                    AppImages.xIcon,
                    width: 44,
                    height: 44,
                  ),
                ),
                SizedBox(width: 16.w),
              ],
            ),
            SizedBox(height: 20.h),
            Image.asset(
              AppImages.premium,
              width: 358.w,
              height: 344.h,
            ),
            const Spacer(),
            const FittedBox(
              child: Text(
                'Professional Category Of Yogaм',
                style: TextStyle(
                  fontFamily: 'mp',
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5C5E8B),
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 15.h),
            const FittedBox(
              child: Text(
                'Professional Category Of Meditation',
                style: TextStyle(
                  fontFamily: 'mp',
                  fontSize: 19,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff5C5E8B),
                  height: 0,
                ),
              ),
            ),
            SizedBox(height: 33.h),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  ButtonWidget(
                    color: const Color(0xffCC2FDA),
                    onPress: () async {
                      await WebPremiumAffordableYoga.setPremium();
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BottomNavigatorScreen(),
                        ),
                        (route) => false,
                      );
                      setState(() {});
                    },
                    text: 'BUY PREMIUM FOR \$0,99',
                    radius: 12,
                    height: 72.h,
                  ),
                  SizedBox(height: 24.h),
                  RestoreButtons(
                    onPressPrivacyPolicy: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebFFAffordableYoga(
                            title: 'Privacy Policy',
                            url: DocFFAffordableYoga.pP,
                          ),
                        ),
                      );
                    },
                    onPressTermOfService: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const WebFFAffordableYoga(
                            title: 'Term of use',
                            url: DocFFAffordableYoga.tUse,
                          ),
                        ),
                      );
                    },
                    onPressRestorePurchases: () {},
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
