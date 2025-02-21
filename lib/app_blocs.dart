import 'package:bloc_shop_app/app_events.dart';
import 'package:bloc_shop_app/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents,AppStates>{
  //0 gets assigned to the counter
  AppBlocs():super(InitStates()){
    on<Increment>((event, emit) {
      emit(AppStates(counter: state.counter + 1));
    });
    on<Decrement>((event,emit){
      emit(AppStates(counter: state.counter - 1));
    });
  } 
}