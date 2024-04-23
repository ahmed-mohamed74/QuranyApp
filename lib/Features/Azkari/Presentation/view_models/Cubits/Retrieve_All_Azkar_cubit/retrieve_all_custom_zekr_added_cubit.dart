import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

import '../../../../../../core/hive_constants.dart';
import '../../../../data/models/edafet_zekr_model.dart';

part 'retrieve_all_custom_zekr_added_state.dart';

class RetrieveAllCustomZekrAddedCubit
    extends Cubit<RetrieveAllCustomZekrAddedState> {
  RetrieveAllCustomZekrAddedCubit()
      : super(RetrieveAllCustomZekrAddedInitial());

  void fetchAllAzkarModafa() {
    emit(
      RetrieveAllCustomZekrLoading(),
    );
    try {
      final azkarBox = Hive.box<EdafetZekrModel>(HiveConstants.edafetZekrkey);
      final azkarModafa = azkarBox.values.toList();
      emit(
        RetriveAllAzkarSuccessfully(azkarData: azkarModafa),
      );
    } on Exception catch (e) {
      emit(
        RetriveAllAzkarFailure(
          errorMessage: e.toString(),
        ),
      );
    }
    // emit(NotesSuccess());
  }
}
