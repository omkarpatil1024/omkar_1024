import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/app_events.dart';
import 'package:ulearning/app_state.dart';

class AppBlocs extends Bloc<AppEvents, AppState> {
  AppBlocs() : super(InitStates()) {
    print("Appbloc running");
    on<Increment>((event, emit) {
      emit(AppState(counter: state.counter + 1));
    });

    on<Decrement>((event, emit) {
      emit(AppState(counter: state.counter - 1));
    });
  }
}
