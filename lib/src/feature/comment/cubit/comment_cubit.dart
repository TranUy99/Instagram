import 'package:bloc/bloc.dart';
import 'package:instagram/src/core/model/comment.dart';
import 'package:meta/meta.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<List<CommentModel>> {
  CommentCubit() : super([]);

   void setComment(List<CommentModel> comment) {
    emit(comment);
  }
}

