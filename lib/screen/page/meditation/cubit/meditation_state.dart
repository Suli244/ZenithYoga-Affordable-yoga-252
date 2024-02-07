part of 'meditation_cubit.dart';

@freezed
class MeditationState with _$MeditationState {
  const factory MeditationState.initial() = _Initial;
  const factory MeditationState.loading() = _Loading;
  const factory MeditationState.success({
    required List<ZarydkaModel> models,
    required List<NoviceTabBar> filterSearchNovice,
    required List<NoviceTabBar> filterSearchArmateur,
    required List<NoviceTabBar> filterSearchProfessional,
    required MaxiChai type,
    required bool search,
  }) = Success;
  const factory MeditationState.error(dynamic e) = _Error;
}
