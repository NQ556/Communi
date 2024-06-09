import 'package:communi_app/core/common/functions/show_snackbar.dart';
import 'package:communi_app/core/common/widgets/loader.dart';
import 'package:communi_app/core/utils/asset_manager.dart';
import 'package:communi_app/core/utils/route_manager.dart';
import 'package:communi_app/core/utils/string_manager.dart';
import 'package:communi_app/features/authentication/presentation/bloc/auth_bloc.dart';
import 'package:communi_app/features/authentication/presentation/widgets/auth_field.dart';
import 'package:communi_app/features/authentication/presentation/widgets/custom_text_button.dart';
import 'package:communi_app/features/authentication/presentation/widgets/rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
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
                  showSnackBar(
                    context,
                    state.message,
                  );
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

                      // Sign In title
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            StringManager.signIn,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
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

                      // Forget password button

                      // Sized box
                      SizedBox(
                        height: 50,
                      ),

                      // Sign In button
                      RoundedButton(
                        buttonText: StringManager.signIn,
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(AuthSignIn(
                                  email: emailController.text.trim(),
                                  password: passwordController.text,
                                ));
                          }
                        },
                      ),

                      // Login using other methods

                      // Sized box
                      SizedBox(
                        height: 30,
                      ),

                      // Sign Up
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            StringManager.accountQuestion,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),

                          //
                          SizedBox(
                            width: 10,
                          ),

                          // Sign Up button
                          CustomTextButton(
                            text: StringManager.signUp,
                            onTap: () {
                              Navigator.pushNamed(context, Routes.signUpRoute);
                            },
                          ),
                        ],
                      )
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
