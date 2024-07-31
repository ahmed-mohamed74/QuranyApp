import '../../../../data/models/azkari_model.dart';

class AzkariState {
  final bool azkariIsLoading;
  final List<ZekrSectionModel>? azkarList;

  const AzkariState({
    this.azkariIsLoading = false,
    this.azkarList,
  });
  AzkariState copyWith({
    bool? azkariIsLoading,
    List<ZekrSectionModel>? azkarList,
    String? azkariFailureState,
  }) {
    return AzkariState(
      azkariIsLoading: azkariIsLoading ?? this.azkariIsLoading,
      azkarList: azkarList ?? this.azkarList,
    );
  }
}
