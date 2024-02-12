import 'package:affordable_yoga_252/MODELS/noter_model.dart';
import 'package:affordable_yoga_252/core/premi/open.dart';
import 'package:affordable_yoga_252/core/urls.dart';
import 'package:affordable_yoga_252/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:affordable_yoga_252/screen/introduction_process/introduction_process_screen.dart';
import 'package:affordable_yoga_252/screen/start/start_screen.dart';
import 'package:apphud/apphud.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:in_app_review/in_app_review.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Apphud.start(apiKey: DocFFAffordableYoga.apphudApiKey);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(LoganXManChelovekAdapter());
  Hive.registerAdapter(NoteTypeAdapter());
  final isFirst = await OpenAffordableYoga.getFirstOpen();
  if (!isFirst) {
    runApp(const MyApp(
      page: IntroductionProcessScreen(),
    ));
    await Future.delayed(const Duration(seconds: 8));
    try {
      final InAppReview inAppReview = InAppReview.instance;
      if (await inAppReview.isAvailable()) {
        inAppReview.requestReview();
      }
    } catch (e) {
      throw Exception(e);
    }
  } else {
    runApp(const MyApp(
      page: BottomNavigatorScreen(),
    ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.page}) : super(key: key);
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Affordable Yoga',
        home: child,
        theme: ThemeData.light().copyWith(
          splashColor: Colors.transparent,
          splashFactory: NoSplash.splashFactory,
          highlightColor: Colors.transparent,
          scaffoldBackgroundColor: const Color(0xffEFEFF9),
          appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xffEFEFF9),
          ),
        ),
      ),
      child: page,
    );
  }
}
