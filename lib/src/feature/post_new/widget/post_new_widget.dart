import 'package:flutter/material.dart';
import 'package:instagram/src/constant/utils/color.dart';

AppBar buildAppBarPost(void Function()? func) {
  return AppBar(
    backgroundColor: kBlueBlandColor,
    title: const Text(
      'Post to',
    ),
    centerTitle: false,
    actions: [
      TextButton(
        onPressed: func,
        child: const Text(
          "Post",
          style: TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
      )
    ],
  );
}
