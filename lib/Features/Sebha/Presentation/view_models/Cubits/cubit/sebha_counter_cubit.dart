import 'package:bloc/bloc.dart';

part 'sebha_counter_state.dart';

class SebhaCounterCubit extends Cubit<SebhaCounterState> {
  SebhaCounterCubit()
      : super(SebhaCounterState(
          count: 0,
        )); // intial state

  void increment() => emit(SebhaCounterState(count: state.count++));
  void decrement() => emit(SebhaCounterState(count: state.count--));
}
