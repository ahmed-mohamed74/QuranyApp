part of 'edafet_zekr_cubit.dart';

@immutable
sealed class EdafetZekrState {}

final class EdafetZekrInitial extends EdafetZekrState {}

final class EdafetZekrLoading extends EdafetZekrState {}

final class EdafetZekrSuccesfully extends EdafetZekrState {}

final class EdafetZekrFailure extends EdafetZekrState {
  final String errorMessage;

  EdafetZekrFailure({required this.errorMessage});
}
