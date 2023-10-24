import 'package:flutter/material.dart';
import 'package:instagram/src/constant/utils/color.dart';

class PostCard extends StatefulWidget {
  final snap;
  const PostCard({
    Key? key,
    required this.snap,
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
                  widget.snap['profImage'].toString(),
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
                        widget.snap['username'].toString(),
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
                                        // deletePost(
                                        //   widget.snap['postId']
                                        //       .toString(),
                                        // );
                                        // remove the dialog box
                                        Navigator.of(context).pop();
                                      }),
                                )
                                .toList()),
                      );
                    },
                  );
                },
                icon: const Icon(Icons.more_vert),
              )
            ],
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          width: double.infinity,
          child: Image.network(
            widget.snap['postUrl'].toString(),
            fit: BoxFit.cover,
          ),
        ),
        Row(
          children: [
            IconButton(
                icon: const Icon(
                  Icons.favorite_border,
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.comment_outlined,
                ),
                onPressed: () {}),
            IconButton(
                icon: const Icon(
                  Icons.send,
                ),
                onPressed: () {}),
            Expanded(
                child: Align(
              alignment: Alignment.bottomRight,
              child: IconButton(icon: const Icon(Icons.bookmark_border), onPressed: () {}),
            ))
          ],
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DefaultTextStyle(
                  style:
                      Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w800),
                  child: Text(
                    '123 likes',
                    style: Theme.of(context).textTheme.bodyMedium,
                  )),
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
                        text: widget.snap['username'].toString(),
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
                onTap: () {}
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: const Text(
                "11/11110",
                  style: TextStyle(
                    color: kGreyColor,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
