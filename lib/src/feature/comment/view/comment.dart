import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/constant/utils/color.dart';
import 'package:instagram/src/feature/comment/cubit/comment_cubit.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../../../core/model/comment.dart';
import '../../home/cubit/user_cubit.dart';
import '../controller/comment_controller.dart';
import '../widget/comment_card.dart';

class Comment extends StatefulWidget {
  final postId;
  const Comment({Key? key, required this.postId}) : super(key: key);

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  final TextEditingController commentEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: kPink,
          title: const Text(
            'Comments',
          ),
          centerTitle: false,
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('posts')
              .doc(widget.postId)
              .collection('comments')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final comment = snapshot.data!.docs.map((document) {
              final data = document.data() as Map<String, dynamic>;
              return CommentModel.fromMap(data);
            }).toList();

            context.read<CommentCubit>().setComment(comment);
         

            log("$comment");
            return CommentCard();
          },
        ),
        // // text input
        bottomNavigationBar: SafeArea(
          child: Container(
            height: kToolbarHeight,
            margin: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            padding: const EdgeInsets.only(left: 16, right: 8),
            child: BlocBuilder<UserBloc, UserState>(builder: (context, user) {
              return Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(user.userDTO.photoUrl!),
                    radius: 18,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      child: TextField(
                        controller: commentEditingController,
                        decoration: InputDecoration(
                          hintText: 'Comment as ${user.userDTO.username}',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      bool postSuccess = await CommentController(context: context).postComment(
                        postId: widget.postId,
                        text: commentEditingController.text,
                        uid: user.userDTO.id!,
                        username: user.userDTO.username!,
                        profilePic: user.userDTO.photoUrl!,
                      );
                      if (postSuccess) {
                        showTopSnackBar(Overlay.of(context),
                            const CustomSnackBar.success(message: 'Post Success'));
                        setState(() {
                          commentEditingController.text = "";
                        });
                      } else {
                        showTopSnackBar(Overlay.of(context),
                            const CustomSnackBar.error(message: 'Post failed'));
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      child: const Text(
                        'Post',
                        style: TextStyle(color: Colors.blue),
                      ),
                    ),
                  )
                ],
              );
            }),
          ),
        ),
      );
    });
  }
}
