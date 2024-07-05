import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/core/utils/show_toast.dart';
import 'package:lost_found/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lost_found/features/auth/presentation/pages/signup.dart';
// import 'package:lost_found/core/suspended/divider.dart';
// import 'package:lost_found/features/auth/presentation/widgets/forgot_password.dart';
import 'package:lost_found/features/auth/presentation/widgets/form_data_field.dart';
import 'package:lost_found/features/auth/presentation/widgets/login_button.dart';
// import 'package:lost_found/features/auth/presentation/widgets/logo_box.dart';
import 'package:lost_found/features/auth/presentation/widgets/switch_login.dart';
import 'package:lost_found/features/main/index_page.dart';

class Login extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const Login());
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Material(
        color: AppPallete.greyShade200,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthLoginFailure) {
              showToast(
                text: state.message,
                context: context,
                color: AppPallete.greyShade200,
              );
            } else if (state is AuthLoginSuccess) {
              showToast(
                text: "Logged in successfully",
                context: context,
                color: AppPallete.greyShade200,
              );
              Navigator.pushAndRemoveUntil(
                  context, IndexPage.route(), (route) => false);
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
                    "Welcome back you've been missed",
                    style: TextStyle(
                      color: AppPallete.deepPurple,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 25),
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
                  // const ForgotPassword(),
                  const SizedBox(height: 25),
                  LoginButton(
                    buttonCommand: "Login",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              AuthLogin(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim(),
                              ),
                            );
                      }
                    },
                  ),
                  const SizedBox(height: 25),
                  // const LoginOptionDivider(),
                  // const SizedBox(
                  //   height: 25.0,
                  // ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     LogoWidget(
                  //       imagePath: "lib/core/assets/images/google.png",
                  //     ),
                  //   ],
                  // ),
                  // const SizedBox(height: 25),
                  SwitchLogin(
                    text: "Not a member?",
                    direction: "Sign Up!",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUp(),
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
