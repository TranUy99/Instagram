import 'package:flutter/cupertino.dart';

import '../../home/view/home.dart';
import '../../post_new/view/post_new.dart';
import '../../profile/view/profile.dart';
import '../../search/view/search.dart';

Widget buildPage(int index) {
  List<Widget> widget = [
    const Home(),
    const Search(),
    const PostNew(),
    const Center(
      child: Text("Chat"),
    ),
    const Profile()
  ];

  return widget[index];
}