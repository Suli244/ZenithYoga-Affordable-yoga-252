import 'dart:developer';

import 'package:affordable_yoga_252/MODELS/noter_model.dart';
import 'package:affordable_yoga_252/screen/page/notes/add_new_note_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<LoganXManChelovek> yoga = [];
  List<LoganXManChelovek> meditation = [];
  late Box<LoganXManChelovek> box;
  @override
  void initState() {
    super.initState();
    yoga = [];
    meditation = [];
    initBox();
    getNotes();
  }

  Future initBox() async {
    if (Hive.isBoxOpen('karakol')) {
      box = Hive.box<LoganXManChelovek>('karakol');
    } else {
      box = await Hive.openBox<LoganXManChelovek>('karakol');
    }
    return box;
  }

  getNotes() async {
    final noterModel = box.values.toList();
    log('data: noterModel: $noterModel ');
    if (noterModel.isNotEmpty) {
      for (var element in noterModel) {
        if (element.noteType == NoteType.Yoga) {
          yoga.add(element);
        } else {
          meditation.add(element);
          log('meditation $meditation');
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('NotesPage'),
      // ),
      body: SafeArea(
        child: FutureBuilder(
          future: initBox(),
          builder: (context, snapShot) {
            if (snapShot.connectionState == ConnectionState.done) {
              return ValueListenableBuilder(
                valueListenable: box.listenable(),
                builder: (context, value, child) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // arnolds
                          const SizedBox(height: 16),
                          const Text(
                            'Notes',
                            style: TextStyle(
                                fontSize: 34,
                                fontWeight: FontWeight.w600,
                                color: Color(0xff0D0F45)),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Yoga',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff0D0F45)),
                          ),
                          const SizedBox(height: 12),
                          yoga.isNotEmpty
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: yoga.length,
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 12,
                                  ),
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         MeditationStartPage(yoga),
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 114,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(16)
                                          .copyWith(bottom: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FittedBox(
                                                child: Text(
                                                  DateFormat('MMMMd').format(
                                                      yoga[index].dateTime),
                                                  style: TextStyle(
                                                    fontSize: 15.h,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 8.h),
                                              Flexible(
                                                child: Text(
                                                  yoga[index].mnogoTexta,
                                                  style: TextStyle(
                                                    fontSize: 12.h,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const Text(
                                  'You have no recordings',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff0D0F45)),
                                ),
                          const SizedBox(height: 24),
                          const Text(
                            'Meditation',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff0D0F45)),
                          ),
                          const SizedBox(height: 12),
                          meditation.isNotEmpty
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    height: 12,
                                  ),
                                  itemCount: meditation.length,
                                  itemBuilder: (context, index) =>
                                      GestureDetector(
                                    onTap: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) =>
                                      //         MeditationStartPage(yoga),
                                      //   ),
                                      // );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      height: 114,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        color: Colors.white,
                                      ),
                                      padding: const EdgeInsets.all(16)
                                          .copyWith(bottom: 0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              FittedBox(
                                                child: Text(
                                                  DateFormat('MMMMd').format(
                                                      meditation[index]
                                                          .dateTime),
                                                  style: TextStyle(
                                                    fontSize: 15.h,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 8.h),
                                              Flexible(
                                                child: Text(
                                                  meditation[index].mnogoTexta,
                                                  style: TextStyle(
                                                    fontSize: 12.h,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  maxLines: 4,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              : const Text(
                                  'You have no recordings',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xff0D0F45)),
                                ),
                          if (!(yoga.isEmpty && meditation.isEmpty))
                            const SizedBox(height: 24),
                          if (!(yoga.isEmpty && meditation.isEmpty))
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const AddNewNotePage(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 56,
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
                          if (!(yoga.isEmpty && meditation.isEmpty))
                            const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
