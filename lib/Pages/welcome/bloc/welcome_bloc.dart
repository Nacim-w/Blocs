import 'package:bloc_shop_app/pages/welcome/bloc/welcome_event.dart';
import 'package:bloc_shop_app/pages/welcome/bloc/welcome_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WelcomeBloc extends Bloc<WelcomeEvent,WelcomeState>{
  WelcomeBloc():super(WelcomeState()){
  on<WelcomeEvent>((event, emit) {
    emit(WelcomeState(page: state.page));
  });
}
}