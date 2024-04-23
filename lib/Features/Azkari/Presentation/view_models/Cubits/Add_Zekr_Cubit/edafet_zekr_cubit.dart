import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../../../../../core/global/Helpers/extensions.dart';
import '../../../../../../core/global/Helpers/generate_random_strings.dart';
import '../../../../../../core/hive_constants.dart';
import '../../../../data/models/edafet_zekr_model.dart';

part 'edafet_zekr_state.dart';

class EdafetZekrCubit extends Cubit<EdafetZekrState> {
  EdafetZekrCubit() : super(EdafetZekrInitial());

  final TextEditingController zekrTitle = TextEditingController();
  final TextEditingController zekrContent = TextEditingController();
  final TextEditingController zekrCount = TextEditingController();

  /// just need to provide it to controller by context.read<EdafetZekrCubit>.zekrCount;

  Future<void> addZekr() async {
    try {
      emit(EdafetZekrLoading());
      final EdafetZekrModel zekrData = EdafetZekrModel(
        title: zekrTitle.text,
        content: zekrContent.text,
        count: int.tryParse(zekrCount.text),
      );
      // If you want to get an already opened box
      var zekrBox = Hive.box<EdafetZekrModel>(HiveConstants.edafetZekrkey);
      await zekrBox.add(zekrData);
      log('zekr added succesfully');
      emit(EdafetZekrSuccesfully());
    } catch (e) {
      emit(EdafetZekrFailure(errorMessage: e.toString()));
    }
  }

  void deleteZekr({required int idKey}) {
    final zekrBox = Hive.box<EdafetZekrModel>(HiveConstants.edafetZekrkey);
    zekrBox.delete(idKey);
  }
}
