import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/model/user.dart';
import '../controller/user_repository .dart';
import '../cubit/user_cubit.dart';

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
        title: Text('Home Page'),
      ),
      body: Center(
        child: BlocBuilder<UserBloc, UserState>(
          builder: (context, state) {
            final userDTO = state.userDTO;
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Username: ${userDTO.username}'),
                Text('Email: ${userDTO.email}'),
              
              ],
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // fetchAndUpdateUser(context); // Fetch and update the UserDTO
      //   },
      //   child: Icon(Icons.refresh),
      // ),
    );
  }
}