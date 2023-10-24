import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/constant/utils/color.dart';
import 'package:intl/intl.dart';

import '../../../core/model/post.dart';
import '../../comment/view/comment.dart';
import '../controller/home.dart';
import '../cubit/user_cubit.dart';
import '../widget/like_animation.dart';

class PostCard extends StatefulWidget {
  const PostCard({
    Key? key,
  }) : super(key: key);

  @override
  State<PostCard> createState() => _PostCardState();
}

class _PostCardState extends State<PostCard> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int commentLen = 0;
    bool isLikeAnimating = false;
    return BlocBuilder<PostBloc, List<PostModel>>(
      builder: (context, posts) {
        return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (ctx, index) {
              final post = posts[index];
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: NetworkImage(
                            post.profImage,
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  post.username,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            showDialog(
                              useRootNavigator: false,
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  child: ListView(
                                    padding: const EdgeInsets.symmetric(vertical: 16),
                                    shrinkWrap: true,
                                    children: [
                                      'Delete',
                                    ]
                                        .map(
                                          (e) => InkWell(
                                              child: Container(
                                                padding: const EdgeInsets.symmetric(
                                                    vertical: 12, horizontal: 16),
                                                child: Text(e),
                                              ),
                                              onTap: () {
                                                 Home().deletePost(
                                                  post.postId,
                                                );
                                                Navigator.of(context).pop();
                                              }),
                                        )
                                        .toList(),
                                  ),
                                );
                              },
                            );
                          },
                          icon: const Icon(Icons.more_vert),
                        )
                      ],
                    ),
                  ),
                  BlocBuilder<UserBloc, UserState>(builder: (context, user) {
                    return GestureDetector(
                      onDoubleTap: () {
                        Home().likePost(
                          post.postId,
                          user.userDTO.id!,
                          post.likes,
                        );
                        setState(() {
                          isLikeAnimating = true;
                        });
                      },
                      child: Stack(alignment: Alignment.center, children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          width: double.infinity,
                          child: Image.network(
                            post.postUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        AnimatedOpacity(
                          duration: const Duration(milliseconds: 200),
                          opacity: isLikeAnimating ? 1 : 0,
                          child: LikeAnimation(
                            isAnimating: isLikeAnimating,
                            duration: const Duration(
                              milliseconds: 400,
                            ),
                            onEnd: () {
                              setState(() {
                                isLikeAnimating = false;
                              });
                            },
                            child: const Icon(
                              Icons.favorite,
                              color: Colors.white,
                              size: 100,
                            ),
                          ),
                        ),
                      ]),
                    );
                  }),
                  //like. comment
                  Row(
                    children: [
                      BlocBuilder<UserBloc, UserState>(builder: (context, user) {
                        return LikeAnimation(
                          isAnimating: post.likes.contains(user.userDTO.id),
                          smallLike: true,
                          child: IconButton(
                            icon: post.likes.contains(user.userDTO.id)
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : const Icon(
                                    Icons.favorite_border,
                                  ),
                            onPressed: () {
                              Home().likePost(
                                post.postId,
                                user.userDTO.id!,
                                post.likes,
                              );
                            },
                          ),
                        );
                      }),
                      IconButton(
                          icon: const Icon(
                            Icons.comment_outlined,
                          ),
                          onPressed: () {
                             context.read<PostIdBloc>().setPostId(post.postId);
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>  Comment(postId:post.postId)));
                          }),
                      IconButton(
                          icon: const Icon(
                            Icons.send,
                          ),
                          onPressed: () {}),
                      Expanded(
                          child: Align(
                        alignment: Alignment.bottomRight,
                        child:
                            IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
                      ))
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${post.likes.length}",
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.only(
                            top: 8,
                          ),
                          child: RichText(
                            text: TextSpan(
                              style: const TextStyle(color: kGreyColor),
                              children: [
                                TextSpan(
                                  text: post.username,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const TextSpan(
                                  text: ' ',
                                ),
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: const Text(
                                'View all  comments',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: kGreyColor,
                                ),
                              ),
                            ),
                            onTap: () {}),
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Text(
                            DateFormat.yMMMd().format(post.datePublished.toDate()),
                            style: const TextStyle(
                              color: kGreyColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              );
            });
      },
    );
  }
}
