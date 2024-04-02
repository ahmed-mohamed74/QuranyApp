part of 'localization_cubit.dart';

sealed class LocalizationState {}

final class LocalizationInitial extends LocalizationState {}

final class EmitAppLanguageChangeState extends LocalizationState {
  final String languageCode;

  EmitAppLanguageChangeState({required this.languageCode});
}
