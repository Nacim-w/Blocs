import 'package:bloc_shop_app/pages/sign_in/bloc/sign_in_events.dart';
import 'package:bloc_shop_app/pages/sign_in/bloc/sign_in_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInBloc extends Bloc<SignInEvent,SignInState>{
  SignInBloc():super(SignInState()){
    on<EmailChanged>(_emailEvent);
    on<PasswordChanged>(_passwordEvent);
  }

  void _emailEvent(EmailChanged event, Emitter<SignInState> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordChanged event, Emitter<SignInState> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }
}