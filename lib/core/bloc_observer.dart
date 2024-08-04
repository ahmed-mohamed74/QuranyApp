import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver implements BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    log('xxx: on change ${bloc.toString()} previous state : ${change.currentState.toString()} current state : ${change.nextState.toString()}');
  }

  @override
  void onClose(BlocBase bloc) {
    log('xxx: on close ${bloc.toString()}');
  }

  @override
  void onCreate(BlocBase bloc) {
    log('xxx: onCreate ${bloc.toString()}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    log('xxx: onEvent ${bloc.toString()}');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log('xxx: onError ${bloc.toString()}');
    log('xxx: onError ${error.toString()}');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log('xxx: onTransition ${bloc.toString()}');
    log('xxx: onTransition ${transition.toString()}');
  }
}
