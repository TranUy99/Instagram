import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/constant/utils/color.dart';
import '../../../core/model/post.dart';
import '../../../core/model/user.dart';
import '../controller/user_repository .dart';
import '../cubit/user_cubit.dart';
import 'post_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Variable to store the username

  @override
  void initState() {
    super.initState();
    fetchAndUpdateUser(context);
  }

  void fetchAndUpdateUser(BuildContext context) async {
    UserRepository userRepository = UserRepository();
    UserDTO userDTO = await userRepository.getUserDetails();

    context.read<UserBloc>().updateUser(userDTO);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPink,
        centerTitle: false,
        title: Image.asset(
          'assets/instagram.jpg',
          width: 60,
          height: 32,
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.messenger_outline,
              color: kGreyColor,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('posts').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final posts = snapshot.data!.docs.map((document) {
            final data = document.data() as Map<String, dynamic>;
            return PostModel.fromMap(data);
          }).toList();

          context.read<PostBloc>().setPosts(posts);

          return PostCard();
        },
      ),
    );
  }
}
