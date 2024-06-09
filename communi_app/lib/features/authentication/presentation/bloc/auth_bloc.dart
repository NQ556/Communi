import 'package:communi_app/features/authentication/domain/usecase/user_sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc({
    required UserSignUp userSignUp,
  })  : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthSignUp>((event, emit) async {
      final response = await _userSignUp.call(UserSignUpParams(
        username: event.username,
        email: event.email,
        password: event.password,
      ));

      response.fold(
        (onLeft) => emit(AuthFailure(onLeft.message)),
        (onRight) => emit(AuthSuccess(onRight)),
      );
    });
  }
}
