import 'package:flutter_bloc/flutter_bloc.dart';

part 'sebha_counter_state.dart';

class SebhaCounterCubit extends Cubit<SebhaCounterState> {
  SebhaCounterCubit()
      : super(SebhaCounterState(
          count: 0,
        )); // intial state

  void increment() => emit(state.copyWith(count: state.count++));
  void decrement() => emit(state.copyWith(count: state.count--));
}
