import 'package:affordable_yoga_252/core/premi/premi.dart';
import 'package:affordable_yoga_252/core/urls.dart';
import 'package:affordable_yoga_252/screen/exclusive/exclusive_screen.dart';
import 'package:affordable_yoga_252/screen/introduction_process/widget/button_widget.dart';
import 'package:affordable_yoga_252/screen/page/configuration/widget/configuration_item_widget.dart';
import 'package:affordable_yoga_252/screen/page/configuration/widget/web_view_insightful_news.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({super.key});

  @override
  State<ConfigurationPage> createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  bool isPremActi = true;

  @override
  void initState() {
    getPremium();
    super.initState();
  }

  getPremium() async {
    isPremActi = await WebPremiumAffordableYoga.getPremium();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings',
          style: TextStyle(
            fontFamily: 'mp',
            fontSize: 34,
            fontWeight: FontWeight.w600,
            color: Color(0xff0D0F45),
          ),
        ),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ConfigurationItemWidget(
                titl: 'Privacy policy',
                onTaab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebFFAffordableYoga(
                        title: 'Privacy Policy',
                        url: DocFFAffordableYoga.pP,
                      ),
                    ),
                  );
                }),
            ConfigurationItemWidget(
                titl: 'Terms of use',
                onTaab: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WebFFAffordableYoga(
                        title: 'Term of use',
                        url: DocFFAffordableYoga.tUse,
                      ),
                    ),
                  );
                }),
            ConfigurationItemWidget(titl: 'Support', onTaab: () {}),
            if (!isPremActi)
              ConfigurationItemWidget(titl: 'Restore purchases', onTaab: () {}),
            const Spacer(),
            if (!isPremActi)
              ButtonWidget(
                color: const Color(0xffCC2FDA),
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ExclusiveScreen(
                        isClose: true,
                      ),
                    ),
                  );
                },
                text: 'GO PREMIUM',
                radius: 12,
                height: 72.h,
              ),
            SizedBox(height: 130.h),
          ],
        ),
      ),
    );
  }
}
