import 'package:bloc_shop_app/Pages/sign_in/bloc/sign_in_events.dart';
import 'package:bloc_shop_app/Pages/sign_in/bloc/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SigninEvent,SigninState>{
  SignInBloc():super(SigninState()){
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }

  void _emailEvent(EmailEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<SigninState> emit) {
    emit(state.copyWith(password: event.password));
  }
}