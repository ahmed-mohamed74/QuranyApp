import 'package:bloc/bloc.dart';
import '../../../../data/models/zekr_model.dart';
import 'azkari_state.dart';
import '../../../../../../core/json_constants.dart';
import '../../../../data/Repository/azkari_repo_implementation.dart';
import '../../../../data/models/azkari_model.dart';


class AzkariCubit extends Cubit<AzkariState> {
  AzkariCubit(this.azkariRepoImpl) : super(const AzkariState(azkarList: []));
  final AzkariRepostoryImplementation azkariRepoImpl;
  List<ZekrSectionModel> azkarList = [];
  Future<void> readAzkarCategories() async {
    try {
      emit(
      state.copyWith(
        azkarList: [],
        azkariIsLoading: true,
      ));
      final List<ZekrSectionModel> response =
          await azkariRepoImpl.readAzkarCategories(
        path: LocalJsonPaths.azkariJsonFilePath,
      );
      azkarList = response;
      emit(
      state.copyWith(
        azkarList: response,
        azkariIsLoading: false,
      ));
    } on Exception catch (e) {
      if (!isClosed) {
        emit(state.copyWith(azkarList: []));
      }
      print(e.toString());
    }
  }

  List<ZekrModel> getSpecifcCategoryAzkar({required String categoryName}) {
    //!TODO: recheck?
    final zekrType = azkarList
        .where((zekrSectionModel) => zekrSectionModel.category == categoryName)
        .first;

    return zekrType.array;
  }
}
