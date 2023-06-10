import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dcp_movil/pages/sign_in/bloc/sign_states.dart';
import 'package:dcp_movil/pages/sign_in/bloc/sing_in_events.dart';

class SignInBloc extends Bloc<SignInEvent, SingInState> {
  SignInBloc() : super(const SingInState()) {
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SingInState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SingInState> emit) {
    emit(state.copyWith(password: event.password));
  }
}
