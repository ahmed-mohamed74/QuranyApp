import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/global/Helpers/extensions.dart';
import '../../../../data/models/edafet_zekr_model.dart';

part 'edit_zekr_cubit_state.dart';

class EditZekrCubitCubit extends Cubit<EditZekrCubitState> {
  EditZekrCubitCubit() : super(EditZekrCubitInitial());

  final TextEditingController zekrTitle = TextEditingController();
  final TextEditingController zekrContent = TextEditingController();
  final TextEditingController zekrCount = TextEditingController();

  editZekr(EdafetZekrModel edafetZekrModel) {
    try {
      emit(EditZekrLoading());
      edafetZekrModel.updateWith(
        content: zekrContent.text,
        count: zekrCount.text.toInt,
        title: zekrTitle.text,
      );
      // save updated data to Hive Implicitly in update with method
      emit(EditZekrSuccesfully(updatedZekr: edafetZekrModel));
    } catch (e) {
      emit(
        EditZekrFailure(
          errorMessage: e.toString(),
        ),
      );
    }
  }
}
