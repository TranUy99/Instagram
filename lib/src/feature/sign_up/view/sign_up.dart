import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/src/feature/sign_up/bloc/sign_up_bloc.dart';

import '../../../constant/utils/color.dart';
import '../../../constant/utils/image.dart';
import '../../login/view/login.dart';

import '../bloc/sign_up_state.dart';
import '../controller/sign_up_controller.dart';
import '../widget/sign_up_widget.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Uint8List? _image;

  selectImage() async {
    Uint8List im = await pickImage(ImageSource.gallery);
     context.read<SignUpBloc>().add(FileEvent(file: im));
      setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kWhiteColor,
          appBar: buildAppBar(),
          body: BlocBuilder<SignUpBloc, SignUpState>(
            builder: (context, state) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              _image != null
                                  ? CircleAvatar(
                                      radius: 64,
                                      backgroundImage: MemoryImage(_image!),
                                      backgroundColor: kWhiteColor,
                                    )
                                  : const CircleAvatar(
                                      radius: 64,
                                      backgroundImage:
                                          NetworkImage('https://i.stack.imgur.com/l60Hf.png'),
                                      backgroundColor: kRedColor,
                                    ),
                              Positioned(
                                bottom: -10,
                                left: 80,
                                child: IconButton(
                                  onPressed:  
                                    selectImage,
                                  
                                  icon: const Icon(Icons.add_a_photo),
                                ),
                              )
                            ],
                          ),
                          reusableText("User Name"),
                          buildTextField("Username", "Enter your username", "email", (value) {
                            context.read<SignUpBloc>().add(UserNameEvent(username: value));
                          }),
                          reusableText("Email"),
                          buildTextField("Email", "Enter your email", "email", (value) {
                            context.read<SignUpBloc>().add(EmailEvent(email: value));
                          }),
                          reusableText("Password"),
                          buildTextField("Password", "Enter your password", "password", (value) {
                            context.read<SignUpBloc>().add(PasswordEvent(password: value));
                          }),
                          reusableText("Bio"),
                          buildTextField("Bio", "Enter your bio", "bio", (value) {
                            context.read<SignUpBloc>().add(BioEvent(bio: value));
                          }),
                          buildLoginButton("Sign Up", () {
                            SignUpController(context: context).handleSignUp();
                          }),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: const Text(
                                  'Dont have an account?',
                                ),
                              ),
                              GestureDetector(
                                onTap: () => Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (context) => const Login(),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: const Text(
                                    ' Login.',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
