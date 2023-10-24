import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../core/model/post.dart';
import '../../../core/model/user.dart';

part 'user_state.dart';

class UserBloc extends Cubit<UserState> {
  UserBloc() : super(UserState(userDTO: UserDTO()));

  void updateUser(UserDTO userDTO) {
    emit(UserState(userDTO: userDTO));
  }
} 



class PostBloc extends Cubit<List<PostModel>> {
  PostBloc() : super([]);

  void setPosts(List<PostModel> posts) {
    emit(posts);
  }
}
class PostIdBloc extends Cubit<PostIdState> {
  PostIdBloc() : super(PostIdState(postId: ""));

  void setPostId( postId) {
    emit(PostIdState(postId:postId));
  }
}
