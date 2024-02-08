import 'package:affordable_yoga_252/core/image/app_images.dart';
import 'package:affordable_yoga_252/screen/page/meditation/child_pages/meditation_detail_page.dart';
import 'package:affordable_yoga_252/screen/page/meditation/cubit/meditation_cubit.dart';
import 'package:affordable_yoga_252/screen/page/meditation/models/meditation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeditationPage extends StatefulWidget {
  const MeditationPage({super.key});

  @override
  State<MeditationPage> createState() => _MeditationPageState();
}

class _MeditationPageState extends State<MeditationPage> {
  final category = [MaxiChai.Novice, MaxiChai.Amateur, MaxiChai.Professional];
  MaxiChai _chai = MaxiChai.Novice;
  @override
  void initState() {
    context.read<MeditationCubit>().alyshKerek();
    getAkcha();
    super.initState();
  }

  bool toOpen = true;

  getAkcha() async {
    final prefs = await SharedPreferences.getInstance();
    toOpen = prefs.getBool('ISBUY') ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocBuilder<MeditationCubit, MeditationState>(
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
                        'Meditation',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 24),
                      TextField(
                        onChanged: (value) {
                          context.read<MeditationCubit>().isdooo(
                                value,
                                _chai,
                                meditations,
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
        children: List.generate(novice.length, (index) {
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
                    child: Image.network(
                      katalizator.mainImage,
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
                            '${katalizator.yogaPlans.length} Sessions',
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
        }),
      );
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

enum MaxiChai {
  Novice,
  Amateur,
  Professional,
  none,
}
