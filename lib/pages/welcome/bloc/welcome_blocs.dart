import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_events.dart';
import 'package:ulearning/pages/welcome/bloc/welcome_states.dart';

class WelcomeBlocs extends Bloc<WelcomeEvents, WelcomeStates> {
  WelcomeBlocs() : super(WelcomeStates()) {
    print("welcome bloc running");
    on<WelcomeEvents>((event, emit) {
      emit(WelcomeStates(page: state.page));
      print(state.page);
    });
  }
}
