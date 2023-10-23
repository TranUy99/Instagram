import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../widget/post_new_widget.dart';

class PostNew extends StatefulWidget {
  const PostNew({super.key});

  @override
  State<PostNew> createState() => _PostNewState();
}

class _PostNewState extends State<PostNew> {
   Uint8List? _file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBarPost(),
      body: Column(
        children: [
          // CircleAvatar(
          //   backgroundImage: NetworkImage(
          //     userProvider.getUser.photoUrl,
          //   ),
          // ),
          SizedBox(
                      height: 45.0,
                      width: 45.0,
                      child: AspectRatio(
                        aspectRatio: 487 / 451,
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                            fit: BoxFit.fill,
                            alignment: FractionalOffset.topCenter,
                            image: MemoryImage(_file!),
                          )),
                        ),
                      ),
                    ),
        ],
      ),
    );
  }
}
