import 'dart:developer';

import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/screen/page/meditation/meditation_page.dart';
import 'package:affordable_yoga_252/screen/page/meditation/models/meditation_model.dart';
import 'package:affordable_yoga_252/screen/page/practice/child_pages/meditation_detail_page.dart';
import 'package:affordable_yoga_252/screen/page/practice/cubit/practice_cubit.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PracticePage extends StatefulWidget {
  const PracticePage({super.key});

  @override
  State<PracticePage> createState() => _PracticePageState();
}

class _PracticePageState extends State<PracticePage> {
  final category = [MaxiChai.Novice, MaxiChai.Amateur, MaxiChai.Professional];
  MaxiChai _chai = MaxiChai.Novice;
  bool toOpen = true;
  @override
  void initState() {
    context.read<PracticeCubit>().alyshKerek();
    getAkcha();
    super.initState();
  }

  getAkcha() async {
    final prefs = await SharedPreferences.getInstance();
    toOpen = prefs.getBool('ISBUY') ?? false;
    log('data: toOpen: $toOpen ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<PracticeCubit, PracticeState>(
            builder: (context, state) {
              return state.when(
                initial: () {
                  return const SizedBox.shrink();
                },
                loading: () {
                  return Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.45,
                        ),
                        const CircularProgressIndicator.adaptive(),
                      ],
                    ),
                  );
                },
                success: (meditations, novice, armateur, professional, type,
                    search) {
                  return Column(
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
                        onChanged: (value) {
                          context.read<PracticeCubit>().isdooo(
                                value,
                                _chai,
                              );
                        },
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
                      FittedBox(
                        child: Row(
                          children: category
                              .map(
                                (txt) => CategoryButton(
                                  chai: txt,
                                  selected: txt == _chai,
                                  tapped: (MaxiChai chai) {
                                    _chai = chai;
                                    setState(() {});
                                  },
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      const SizedBox(height: 24),
                      if (meditations.isNotEmpty)
                        getTab(meditations[_chai.index], toOpen)
                    ],
                  );
                },
                error: (error) {
                  return Center(
                    child: Text(
                      error,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getTab(ZarydkaModel model, bool hahaha) {
    switch (_chai) {
      case MaxiChai.Amateur:
        return BodyList(
          novice: model.amateur,
        );
      case MaxiChai.Professional:
        return BodyList(
          hahaha: hahaha,
          novice: model.professional,
        );
      default:
        return BodyList(
          novice: model.novice,
        );
    }
  }

  Widget getTabSearch(List<NoviceTabBar> list) {
    return BodyList(
      novice: list,
    );
  }
}

class BodyList extends StatelessWidget {
  const BodyList({super.key, required this.novice, this.hahaha = true});
  final List<NoviceTabBar> novice;
  final bool hahaha;

  @override
  Widget build(BuildContext context) {
    if (novice.isNotEmpty && hahaha) {
      return Column(
          children: List.generate(
        novice.length,
        (index) {
          final katalizator = novice[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>
                    MeditationDetailPage(katalizator: katalizator),
              ),
            ),
            child: Container(
              margin: const EdgeInsets.only(bottom: 12),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: katalizator.mainImage,
                      placeholder: (context, url) =>
                          const Center(child: CupertinoActivityIndicator()),
                      fit: BoxFit.cover,
                      height: 81,
                      width: 81,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: FittedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            katalizator.title,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            '${katalizator.yogaPlans.length} Lessons',
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
            ),
          );
        },
      ).toList());

      // Expanded(
      //   child: ListView.separated(
      //     itemCount: novice.length,
      //     separatorBuilder: (BuildContext context, int index) {
      //       return const SizedBox(
      //         height: 12,
      //       );
      //     },
      //     itemBuilder: (BuildContext context, int index) {
      //       final katalizator = novice[index];
      //       return
      //     },
      //   ),
      // );
    } else if (!hahaha) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.premium,
              scale: 6.5,
            ),
            const Text(
              'NEED PREMIUM',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.w600,
                color: Color(0xff5C5E8B),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'This category requires Premium',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: Color(0xff5C5E8B),
              ),
            ),
          ],
        ),
      );
    } else {
      return const Center(
        child: Text(
          'not found',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
          ),
        ),
      );
    }
  }
}

class CategoryButton extends StatelessWidget {
  const CategoryButton({
    super.key,
    required this.chai,
    required this.selected,
    required this.tapped,
  });
  final MaxiChai chai;
  final bool selected;
  final Function(MaxiChai chai) tapped;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => tapped(chai),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: selected ? const Color(0xffA65EEF) : Colors.white,
        ),
        margin: const EdgeInsets.only(right: 8),
        alignment: Alignment.center,
        child: Text(
          chai.name,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: selected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}
