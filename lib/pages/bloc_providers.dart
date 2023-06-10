import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dcp_movil/pages/register/bloc/register_blocs.dart';
import 'package:dcp_movil/pages/sign_in/bloc/sign_in_blocs.dart';

import 'Welcome/bloc/welcome_blocs.dart';

class AppBlocProviders {
  static get allBlocProviders => [
        BlocProvider(lazy: false, create: (context) => WelcomeBloc()),
        //BlocProvider(lazy: false, create: (context) => AppBlocs()),
        BlocProvider(create: (context) => SignInBloc()),
        BlocProvider(create: (context) => RegisterBlocs()),
      ];
}
