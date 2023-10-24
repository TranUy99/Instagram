import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/core/model/comment.dart';
import 'package:instagram/src/feature/comment/cubit/comment_cubit.dart';
import 'package:intl/intl.dart';

class CommentCard extends StatelessWidget {
  const CommentCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentCubit, List<CommentModel>>(
      builder: (context, state) {
       
        return ListView.builder(
            itemCount: state.length,
            itemBuilder: (ctx, index) {
              final comment = state[index];
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        comment.profilePic,
                      ),
                      radius: 18,
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(comment.username,style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                          ),),
                                        Text(
                                          DateFormat.yMMMd().format(
                                            comment.datePublished.toDate(),
                                          ),
                                          style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(comment.text)
                                  ],
                                )),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8),
                      child: const Icon(
                        Icons.favorite,
                        size: 16,
                      ),
                    )
                  ],
                ),
              );
            });
      },
    );
  }
}
