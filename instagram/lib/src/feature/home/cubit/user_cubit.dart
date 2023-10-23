import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/model/user.dart';

part 'user_state.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc() : super(UserState(userDTO: UserDTO()));

  void updateUser(UserDTO userDTO) {
    emit(UserState(userDTO: userDTO));
  }
}