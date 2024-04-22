// part of 'azkari_cubit.dart';

// @immutable
// class AzkariState {
//   final bool? azkariIsLoading;
//   final List<ZekrModel>? loadedAzkar;
//   final String? azkariFailureState;

//   const AzkariState({
//     this.azkariIsLoading,
//     this.loadedAzkar,
//     this.azkariFailureState,
//   });
//   AzkariState copyWith({
//     bool? azkariIsLoading,
//     List<ZekrModel>? loadedAzkar,
//     String? azkariFailureState,
//   }) {
//     return AzkariState(
//       azkariIsLoading: azkariIsLoading ?? this.azkariIsLoading,
//       loadedAzkar: loadedAzkar ?? this.loadedAzkar,
//       azkariFailureState: azkariFailureState ?? this.azkariFailureState,
//     );
//   }
// }
part of 'azkari_cubit.dart';

@immutable
sealed class AzkariState {}

final class AzkariInitial extends AzkariState {}

final class AzkariIsLoading extends AzkariState {}

final class AzkariLoadedSuccesfully extends AzkariState {
  final List<ZekrSectionModel> loadedAzkar;

  AzkariLoadedSuccesfully({required this.loadedAzkar});
}

final class AzkariFailureState extends AzkariState {
  final String errorMessage;

  AzkariFailureState({required this.errorMessage});
}
