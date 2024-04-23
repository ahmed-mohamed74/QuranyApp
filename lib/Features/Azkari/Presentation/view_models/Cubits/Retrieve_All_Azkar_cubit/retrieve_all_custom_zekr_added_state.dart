part of 'retrieve_all_custom_zekr_added_cubit.dart';

@immutable
sealed class RetrieveAllCustomZekrAddedState {}

final class RetrieveAllCustomZekrAddedInitial
    extends RetrieveAllCustomZekrAddedState {}

final class RetriveAllAzkarSuccessfully
    extends RetrieveAllCustomZekrAddedState {
  final List<EdafetZekrModel> azkarData;

  RetriveAllAzkarSuccessfully({required this.azkarData});
}

final class RetriveAllAzkarFailure extends RetrieveAllCustomZekrAddedState {
  final String errorMessage;

  RetriveAllAzkarFailure({required this.errorMessage});
}

final class RetrieveAllCustomZekrLoading
    extends RetrieveAllCustomZekrAddedState {}
