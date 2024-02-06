import 'dart:developer';

import 'package:affordable_yoga_252/MODELS/noter_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({super.key});

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {
  List<LoganXManChelovek> arnolds = [];
  @override
  void initState() {
    super.initState();
    getNotes();
  }

  getNotes() async {
    var noter = await Hive.openBox<LoganXManChelovek>('karakol');
    final noterModel = noter.values.toList();
    if (noterModel.isNotEmpty) {
      arnolds = noterModel;
    }
    log('data: arnolds: $arnolds ');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('NotesPage'),
      ),
      body: Column(
        children: [
          // arnolds
          Container(),
        ],
      ),
    );
  }
}
