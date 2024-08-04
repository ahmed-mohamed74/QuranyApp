import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/json_constants.dart';
import '../../../../data/Repository/hsn_muslim_base_repostory.dart';
import '../../../../data/models/zekr_model.dart';
import '../../../../data/models/zekr_section_model.dart';
import 'hsn_muslim_state.dart';

class HsnMuslimCubit extends Cubit<HsnMuslimState> {
  HsnMuslimCubit(this._baseAzkariRepostory)
      : super(
          HsnMuslimState(
            azkarList: const [],
            azkariIsLoading: false,
            zekrCountProgress: 0,
          ),
        );
  final BaseHsnMuslimRepostory _baseAzkariRepostory;

  final PageController pageController = PageController();

  List<ZekrSectionModel> azkarList = [];
  Future<void> readAzkarCategories() async {
    try {
      emit(state.copyWith(
        azkarList: [],
        azkariIsLoading: true,
      ));
      final List<ZekrSectionModel> response =
          await _baseAzkariRepostory.readAzkarCategories(
        path: LocalJsonPaths.azkariJsonFilePath,
      );
      azkarList = response;
      emit(state.copyWith(
        azkarList: response,
        azkariIsLoading: false,
      ));
    } on Exception catch (e) {
      // if (!isClosed) {
      //   emit(state.copyWith(azkarList: []));
      // }
      log(e.toString());
    }
  }

  List<ZekrModel> getSpecifcCategoryAzkar({required String categoryName}) {
    //!TODO: recheck?
    final zekrType = azkarList
        .where((zekrSectionModel) => zekrSectionModel.category == categoryName)
        .first;

    return zekrType.array;
  }

  void incrementZekrCount() {
    emit(state.copyWith(zekrCount: state.zekrCountProgress + 1));
  }

  resetState() {
    emit(
      HsnMuslimState(
        azkarList: azkarList,
        azkariIsLoading: false,
        zekrCountProgress: 0,
      ),
    );
  }

  goToNextPage() {
    pageController.nextPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  goToPreviousPage() {
    pageController.previousPage(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
