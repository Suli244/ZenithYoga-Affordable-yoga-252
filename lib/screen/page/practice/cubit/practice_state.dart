part of 'practice_cubit.dart';

@freezed
class PracticeState with _$PracticeState {
  const factory PracticeState.initial() = _Initial;
  const factory PracticeState.loading() = _Loading;
  const factory PracticeState.success({
    required List<ZarydkaModel> models,
    required List<NoviceTabBar> filterSearchNovice,
    required List<NoviceTabBar> filterSearchArmateur,
    required List<NoviceTabBar> filterSearchProfessional,
    required MaxiChai type,
    required bool search,
  }) = Success;
  const factory PracticeState.error(dynamic e) = _Error;
}
