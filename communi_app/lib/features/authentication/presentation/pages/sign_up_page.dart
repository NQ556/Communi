import 'package:communi_app/core/common/functions/show_snackbar.dart';
import 'package:communi_app/core/common/widgets/loader.dart';
import 'package:communi_app/core/utils/asset_manager.dart';
import 'package:communi_app/core/utils/string_manager.dart';
import 'package:communi_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:communi_app/features/authentication/presentation/widgets/auth_field.dart';
import 'package:communi_app/features/authentication/presentation/widgets/rounded_back_button.dart';
import 'package:communi_app/core/common/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final formKey = GlobalKey<FormState>();

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
          child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            // Background
            Container(
              width: double.infinity,
              height: double.infinity,
              child: SvgPicture.asset(
                ImageManager.background,
                fit: BoxFit.cover,
              ),
            ),

            // Sign In Contents
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  showSnackBar(context, state.message);
                }
              },
              builder: (context, state) {
                if (state is AuthLoading) {
                  return Loader();
                }
                return Form(
                  key: formKey,
                  child: Column(
                    children: [
                      // App Name
                      Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: EdgeInsets.only(right: 20),
                          child: Text(
                            StringManager.appName,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                      ),

                      // Sized box
                      SizedBox(
                        height: 50,
                      ),

                      // Sign up title
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            StringManager.signUp,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                      ),

                      // Sized box
                      SizedBox(
                        height: 30,
                      ),

                      // Input username
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: AuthField(
                          hintText: StringManager.username,
                          textEditingController: usernameController,
                        ),
                      ),

                      // Sized box
                      SizedBox(
                        height: 30,
                      ),

                      // Input email
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: AuthField(
                          hintText: StringManager.email,
                          textEditingController: emailController,
                        ),
                      ),

                      // Sized box
                      SizedBox(
                        height: 30,
                      ),

                      // Input password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: AuthField(
                          hintText: StringManager.password,
                          textEditingController: passwordController,
                          isObscure: true,
                        ),
                      ),

                      // Sized box
                      SizedBox(
                        height: 30,
                      ),

                      // Input confirm password
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        child: AuthField(
                          hintText: StringManager.confirmPassword,
                          textEditingController: confirmController,
                          isObscure: true,
                        ),
                      ),

                      // Sized box
                      SizedBox(
                        height: 50,
                      ),

                      // Sign Up button
                      RoundedButton(
                        buttonText: StringManager.signUp,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            String password = passwordController.text;
                            String confirmPassword = confirmController.text;

                            if (password == confirmPassword) {
                              context.read<AuthBloc>().add(AuthSignUp(
                                    username: usernameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: password,
                                  ));
                            } else {
                              showSnackBar(context,
                                  "You must confirm the same password.");
                            }
                          }
                        },
                      ),

                      // Sized box
                      SizedBox(
                        height: 10,
                      ),

                      // Back button
                      RoundedBackButton(
                        buttonText: StringManager.back,
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                );
              },
            )
          ],
        ),
      )),
    );
  }
}
