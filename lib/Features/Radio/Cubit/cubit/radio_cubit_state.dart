part of 'radio_cubit_cubit.dart';

@immutable
sealed class RadioCubitState {}

final class RadioCubitInitial extends RadioCubitState {}

final class RadioCubitLoading extends RadioCubitState {}

final class RadioCubitSuccess extends RadioCubitState {
  final List<RadioModel> radiosData;

  RadioCubitSuccess({required this.radiosData});
}

final class RadioCubitFailure extends RadioCubitState {
  final String errorMessage;

  RadioCubitFailure({required this.errorMessage});
}
