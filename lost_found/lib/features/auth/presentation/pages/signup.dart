import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_toast.dart';
import 'package:lost_found/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lost_found/features/auth/presentation/pages/login.dart';
import 'package:lost_found/features/auth/presentation/widgets/form_data_field.dart';
import 'package:lost_found/features/auth/presentation/widgets/login_button.dart';
import 'package:lost_found/features/auth/presentation/widgets/switch_login.dart';
import 'package:lost_found/features/main/index_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: AppPallete.greyShade200,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthSignUpFailure) {
              if (state.message == "Null check operator used on a null value") {
                showToast(
                  text: "Please verify your email",
                  context: context,
                  color: AppPallete.greyShade200,
                );

                Future.delayed(const Duration(seconds: 1), () {
                  Navigator.push(context, Login.route());
                });
              } else {
                showToast(
                  text: state.message,
                  context: context,
                  color: AppPallete.greyShade200,
                );
              }
            } else if (state is AuthSignUpSuccess) {
              showToast(
                text: "Acoount created successfully",
                context: context,
                color: AppPallete.greyShade200,
              );
              Navigator.pushAndRemoveUntil(
                context,
                IndexPage.route(),
                (Route<dynamic> route) => false,
              );
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Loader();
            }

            return Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  const Icon(
                    Icons.lock,
                    size: 100,
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  const Text(
                    "Ready to get started?",
                    style: TextStyle(
                      color: AppPallete.lightPurple,
                      fontSize: 16.0,
                    ),
                  ),
                  const Text(
                    "Let's create an account!",
                    style: TextStyle(
                      color: AppPallete.deepPurple,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 25),
                  FormDataFields(
                    controller: nameController,
                    hintText: "Name",
                  ),
                  const SizedBox(height: 10),
                  FormDataFields(
                    controller: emailController,
                    hintText: "Email",
                  ),
                  const SizedBox(height: 10),
                  FormDataFields(
                    controller: passwordController,
                    hintText: "Password",
                    obscureText: true,
                  ),
                  const SizedBox(height: 10),
                  const SizedBox(height: 25),
                  LoginButton(
                    buttonCommand: "Sign Up",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthSignUp(
                                email: emailController.text.trim(),
                                name: nameController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  SwitchLogin(
                    text: "Already a member?",
                    direction: "Login!",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Login(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
