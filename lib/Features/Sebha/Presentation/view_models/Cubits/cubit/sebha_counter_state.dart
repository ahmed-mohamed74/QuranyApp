part of 'sebha_counter_cubit.dart';

class SebhaCounterState {
  int count;
  SebhaCounterState({
    required this.count,
  });

  SebhaCounterState copyWith({
    int? count,
  }) {
    return SebhaCounterState(
      count: count ?? this.count,
    );
  }
}
