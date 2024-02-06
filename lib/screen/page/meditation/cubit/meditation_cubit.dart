import 'dart:developer';

import 'package:affordable_yoga_252/screen/page/meditation/meditation_page.dart';
import 'package:affordable_yoga_252/screen/page/meditation/models/meditation_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'meditation_cubit.freezed.dart';
part 'meditation_state.dart';

class MeditationCubit extends Cubit<MeditationState> {
  MeditationCubit() : super(const MeditationState.initial());
  final dio = Dio();

  List<ZarydkaModel> resultHallaa = [];
  List<ZarydkaModel> filterSearch = [];
  Future<void> alyshKerek() async {
    emit(const MeditationState.loading());
    try {
      final result = await dio.get(
          'https://zenithyoga-affordable-yoga-252-default-rtdb.firebaseio.com/Meditation.json?auth=AIzaSyATIUAR9ZPmO7-zSZmJlMbjmbGCzfinGlc');
      final listModel = result.data.map<ZarydkaModel>(
        (e) {
          return ZarydkaModel.fromJson(
            e,
          );
        },
      ).toList();
      resultHallaa.addAll(listModel);
      // result.data.indexOf(e) < 2,
      log('data: resultHallaa: $resultHallaa ');
      emit(
        MeditationState.success(
          models: resultHallaa,
          search: false,
        ),
      );
    } catch (e) {
      emit(MeditationState.error(e));
    }
  }

  isdooo(String text, MaxiChai type) {
    // try {
    //   if (text.isNotEmpty) {
    //     filterSearch = resultHallaa[type.index].where((model) {
    //       return model. title.toLowerCase().contains(text.toLowerCase());
    //     }).toList();
    //   } else {
    //     filterSearch = resultHallaa;
    //   }
    //   emit(
    //     MeditationState.success(
    //       models: filterSearch,
    //       search: text.isNotEmpty,
    //     ),
    //   );
    // } catch (e) {
    //   emit(MeditationState.error(e.toString()));
    // }
  }
}
