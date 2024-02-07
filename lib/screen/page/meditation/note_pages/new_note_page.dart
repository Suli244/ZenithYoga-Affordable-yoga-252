import 'package:affordable_yoga_252/MODELS/noter_model.dart';
import 'package:affordable_yoga_252/screen/bottom_navigation_bar/bottom_naviator_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key, required this.noteType,   this.currentIndex = 1});

  final NoteType noteType;
  final int currentIndex;

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  late FocusNode _focusNode;
  late GlobalKey<FormState> _formKey;
  late TextEditingController _descController;

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
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(24),
                        alignment: Alignment.centerLeft,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.white,
                        ),
                        child: Text(
                          widget.noteType.name,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff0D0F45),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
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
                          contentPadding: const EdgeInsets.all(24),
                          hintText: 'Your thoughts',
                          hintStyle: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          fillColor: Colors.white,
                          filled: true,
                        ),
                        controller: _descController,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () async {
                  if (_formKey.currentState?.validate() == true) {
                    final arnold = LoganXManChelovek(
                      noteType: NoteType.Yoga,
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
                        builder: (_) => BottomNavigatorScreen(
                          currentIndex: widget.currentIndex,
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
            ],
          ),
        ),
      ),
    );
  }
}
