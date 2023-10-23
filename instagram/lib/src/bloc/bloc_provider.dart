import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/feature/sign_up/bloc/sign_up_bloc.dart';





class AppBlocProvider {
  static get allBlocProvider => [
     
        BlocProvider(
          create: (context) => SignUpBloc(),
        ),
      ];
}