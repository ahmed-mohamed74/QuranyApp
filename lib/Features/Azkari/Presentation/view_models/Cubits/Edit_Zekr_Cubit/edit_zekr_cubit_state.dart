part of 'edit_zekr_cubit_cubit.dart';

@immutable
sealed class EditZekrCubitState {}

final class EditZekrCubitInitial extends EditZekrCubitState {}

final class EditZekrLoading extends EditZekrCubitState {}

final class EditZekrSuccesfully extends EditZekrCubitState {
  final EdafetZekrModel updatedZekr;

  EditZekrSuccesfully({required this.updatedZekr});
}

final class EditZekrFailure extends EditZekrCubitState {
  final String errorMessage;

  EditZekrFailure({required this.errorMessage});
}
