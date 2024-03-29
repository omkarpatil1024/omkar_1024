import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/application/bloc/apps_events.dart';
import 'package:ulearning/pages/application/bloc/apps_states.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppState(index: event.index));
    });
  }
}
