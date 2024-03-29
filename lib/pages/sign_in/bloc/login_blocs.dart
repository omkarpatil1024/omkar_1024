import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ulearning/pages/sign_in/bloc/login_events.dart';
import 'package:ulearning/pages/sign_in/bloc/login_states.dart';

class SignInBlocs extends Bloc<SignInEvents, SignInStates> {
  SignInBlocs() : super(SignInStates()) {
    //2 ways to write the code
    on<EmailEvent>(_emailEvent);

    on<PasswordEvent>((event, emit) => {
          print(event.password),
          emit(state.copyWith(password: event.password))
        });
  }

  void _emailEvent(EmailEvent event, Emitter<SignInStates> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }
}
