import 'package:bloc_shop_app/Pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:bloc_shop_app/Pages/welcome/bloc/welcome_bloc.dart';
import 'package:bloc_shop_app/app_blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders{
  static get allBlocProviders => [

    BlocProvider(
          create: (context) => AppBlocs(),
        ),
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context)=>SignInBloc(),
        ),
  ];
}