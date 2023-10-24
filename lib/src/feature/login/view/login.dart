import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram/src/feature/login/bloc/login_event.dart';

import '../../../constant/utils/color.dart';
import '../../sign_up/view/sign_up.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';
import '../controller/login_controller.dart';
import '../widget/login_widget.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: SafeArea(
        child: Scaffold(
          backgroundColor: kWhiteColor,
          appBar: buildAppBar(),
          body: BlocBuilder<LoginBloc, LoginState>(
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
                          reusableText("Email"),
                          buildTextField("Email", "Enter your email", "email", (value) {
                            context.read<LoginBloc>().add(EmailEvent(value));
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          reusableText("Password"),
                          buildTextField("Password", "Enter your Password", "password", (value) {
                            context.read<LoginBloc>().add(PasswordEvent(value));
                          }),
                          buildLoginButton("Login", () {
                            LoginController(context: context).handleLogin();
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
                                    builder: (context) => const SignUp(),
                                  ),
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 8),
                                  child: const Text(
                                    ' Sign up.',
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
