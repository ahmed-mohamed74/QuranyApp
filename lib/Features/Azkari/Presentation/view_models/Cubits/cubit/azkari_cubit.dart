import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../../../../../core/json_constants.dart';
import '../../../../data/Repository/azkari_repo_implementation.dart';
import '../../../../data/models/azkari_model.dart';

part 'azkari_state.dart';

class AzkariCubit extends Cubit<AzkariState> {
  AzkariCubit(this.azkariRepoImpl) : super(AzkariInitial());
  final AzkariRepostoryImplementation azkariRepoImpl;
  Future<void> readAzkarData() async {
    emit(
      AzkariIsLoading(),
    );
    try {
      final List<ZekrSectionModel> response = await azkariRepoImpl
          .loadZekrSections(path: LocalJsonPaths.azkariJsonFilePath);
      emit(
        AzkariLoadedSuccesfully(loadedAzkar: response),
      );
    } catch (e) {
      log(e.toString());
      emit(
        AzkariFailureState(errorMessage: e.toString()),
      );
    }
  }

  //  Future<void> getSpecifcCategoryAzkar({required String  categoryName}){

  //  }
}
