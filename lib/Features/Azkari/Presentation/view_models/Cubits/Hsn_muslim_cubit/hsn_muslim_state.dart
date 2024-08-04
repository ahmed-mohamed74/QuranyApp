import 'package:equatable/equatable.dart';

import '../../../../data/models/zekr_section_model.dart';

class HsnMuslimState extends Equatable {
  final bool azkariIsLoading;
  final List<ZekrSectionModel>? azkarList;
  int zekrCountProgress = 0;

  HsnMuslimState({
    required this.azkariIsLoading,
    required this.azkarList,
    required this.zekrCountProgress,
  });
  // const HsnMuslimState({
  //   this.azkariIsLoading = false,
  //   this.azkarList,
  // });
  HsnMuslimState copyWith({
    bool? azkariIsLoading,
    List<ZekrSectionModel>? azkarList,
    String? azkariFailureState,
    int? zekrCount,
  }) {
    return HsnMuslimState(
      azkariIsLoading: azkariIsLoading ?? this.azkariIsLoading,
      azkarList: azkarList ?? this.azkarList,
      zekrCountProgress: zekrCount ?? zekrCountProgress,
    );
  }

  @override
  List<Object?> get props => [azkariIsLoading, azkarList, zekrCountProgress];
}
