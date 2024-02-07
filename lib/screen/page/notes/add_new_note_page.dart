import 'package:affordable_yoga_252/MODELS/noter_model.dart';
import 'package:affordable_yoga_252/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';

class AddNewNotePage extends StatefulWidget {
  const AddNewNotePage({super.key});

  // final NoteType noteType;

  @override
  State<AddNewNotePage> createState() => _AddNewNotePageState();
}

class _AddNewNotePageState extends State<AddNewNotePage> {
  late FocusNode _focusNode;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _descController;
  late int type;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _focusNode = FocusNode();
    _descController = TextEditingController();
  }

  @override
  void dispose() {
    _descController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: const Text(
          'New Note',
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 24.h,
                      ),
                      Container(
                        height: 72.h,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: DropdownButtonFormField<int>(
                          // padding: const EdgeInsets.symmetric(horizontal: 16),
                          icon: const Icon(Icons.keyboard_arrow_down_outlined),
                          validator: (value) {
                            if (value == null) {
                              return 'Choose field';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            filled: true,
                            hintStyle: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff5C5E8B)),
                            fillColor: Colors.white,
                            contentPadding:
                                const EdgeInsets.symmetric(horizontal: 16),
                            hintText: 'Choose field',
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                  width: 1,
                                  color: Color(0xffF74F5C),
                                  style: BorderStyle.solid,
                                )),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                          ),
                          items: {1: NoteType.Yoga, 2: NoteType.Meditation}
                              .map((key, value) {
                                return MapEntry(
                                  value.name.toString(),
                                  DropdownMenuItem<int>(
                                    value: value.index,
                                    child: Text(
                                      value.name.toString(),
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff5C5E8B)),
                                    ),
                                  ),
                                );
                              })
                              .values
                              .toList(),
                          onChanged: (newValue) async {
                            type = newValue!;
                          },
                        ),
                        // Text(
                        //   widget.noteType.name,
                        //   style: const TextStyle(
                        //     fontSize: 15,
                        //     fontWeight: FontWeight.w400,
                        //     color: Color(0xff0D0F45),
                        //   ),
                        // ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        // height: 72.h,
                        child: TextFormField(
                          onTapOutside: (event) {
                            FocusManager.instance.primaryFocus?.unfocus();
                          },
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          validator: (value) {
                            if (value?.isEmpty == true) {
                              return 'Required Input';
                            } else if (value!.length <= 10) {
                              return 'write more 10 words';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(16),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                              ),
                            ),
                            // contentPadding: const EdgeInsets.all(24),
                            hintText: 'Your thoughts',
                            hintStyle: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                          controller: _descController,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState?.validate() == true) {
                    final arnold = LoganXManChelovek(
                      noteType: type == 0 ? NoteType.Yoga : NoteType.Meditation,
                      mnogoTexta: _descController.text,
                      dateTime: DateTime.now(),
                    );
                    var tayotaCrown = await Hive.openBox<LoganXManChelovek>(
                      'karakol',
                    );
                    tayotaCrown.add(arnold);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const BottomNavigatorScreen(
                          currentIndex: 3,
                        ),
                      ),
                      (route) => false,
                    );
                  }
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
                    'Complete',
                    style: TextStyle(
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
