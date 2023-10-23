import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/feature/login/bloc/login_bloc.dart';
import 'package:instagram/src/feature/sign_up/bloc/sign_up_bloc.dart';

import '../feature/home/cubit/user_cubit.dart';





class AppBlocProvider {
  static get allBlocProvider => [
     
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
         BlocProvider(
          create: (context) => LoginBloc(),
        ),
         BlocProvider(
      create: (context) => UserBloc(),)
      ];
}