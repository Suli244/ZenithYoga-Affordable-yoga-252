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
  List<NoviceTabBar> filterSearchNovice = [];
  List<NoviceTabBar> filterSearchArmateur = [];
  List<NoviceTabBar> filterSearchProfessional = [];
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
      emit(
        MeditationState.success(
          models: resultHallaa,
          search: false,
          filterSearchNovice: filterSearchNovice,
          filterSearchArmateur: filterSearchArmateur,
          filterSearchProfessional: filterSearchProfessional,
          type: MaxiChai.none,
        ),
      );
    } catch (e) {
      emit(MeditationState.error(e));
    }
  }

  // isdoooOld(String text, MaxiChai type) {
  //   try {
  //     if (text.isNotEmpty) {
  //       filterSearch = resultHallaa.where((model) {
  //         return model title.toLowerCase().contains(text.toLowerCase());
  //       }).toList();
  //     } else {
  //       filterSearch = resultHallaa;
  //     }
  //     emit(
  //       MeditationState.success(
  //         models: filterSearch,
  //         search: text.isNotEmpty,
  //       ),
  //     );
  //   } catch (e) {
  //     emit(MeditationState.error(e.toString()));
  //   }
  // }
  isdooo(String text, MaxiChai type, List<ZarydkaModel> model) {
    try {
      if (text.isNotEmpty) {
        switch (type) {
          case MaxiChai.Novice:
            filterSearchNovice = resultHallaa[type.index].novice.where((model) {
              return model.title.toLowerCase().contains(
                    text.toLowerCase(),
                  );
            }).toList();
          case MaxiChai.Amateur:
            filterSearchArmateur =
                resultHallaa[type.index].amateur.where((model) {
              return model.title.toLowerCase().contains(
                    text.toLowerCase(),
                  );
            }).toList();
          case MaxiChai.Professional:
            filterSearchProfessional =
                resultHallaa[type.index].professional.where((model) {
              return model.title.toLowerCase().contains(
                    text.toLowerCase(),
                  );
            }).toList();

          default:
        }
        log('data: filterSearchNovice: $filterSearchNovice ');
      } else {
        filterSearch = resultHallaa;
        filterSearchNovice = resultHallaa.first.novice;
        filterSearchArmateur = resultHallaa[1].amateur;
        filterSearchProfessional = resultHallaa[2].professional;
      }

      emit(
        MeditationState.success(
          models: [
            ZarydkaModel(
              novice: filterSearchNovice,
              amateur: filterSearchArmateur,
              professional: filterSearchProfessional,
            ),
            ZarydkaModel(
              novice: filterSearchNovice,
              amateur: filterSearchArmateur,
              professional: filterSearchProfessional,
            ),
            ZarydkaModel(
              novice: filterSearchNovice,
              amateur: filterSearchArmateur,
              professional: filterSearchProfessional,
            ),
          ],
          search: text.isNotEmpty,
          filterSearchNovice: filterSearchNovice,
          filterSearchArmateur: filterSearchArmateur,
          filterSearchProfessional: filterSearchProfessional,
          type: type,
        ),
      );
    } catch (e) {
      emit(MeditationState.error(e.toString()));
    }
  }
}
