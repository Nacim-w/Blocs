import 'package:bloc_shop_app/pages/register/bloc/register_bloc.dart';
import 'package:bloc_shop_app/pages/sign_in/bloc/sign_in_blocs.dart';
import 'package:bloc_shop_app/pages/welcome/bloc/welcome_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => SignInBloc(),
        ),
        BlocProvider(
          create: (context) => RegisterBloc(),
        ),
      ];
}
