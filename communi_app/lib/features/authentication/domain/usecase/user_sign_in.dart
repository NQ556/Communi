import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/core/usecase/usecase.dart';
import 'package:communi_app/core/common/entities/user.dart';
import 'package:communi_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class UserSignIn implements Usecase<User, UserSignInParams> {
  final AuthRepository authRepository;
  UserSignIn(this.authRepository);

  @override
  Future<Either<Failure, User>> call(UserSignInParams params) async {
    return await authRepository.signInWithEmail(
      email: params.email,
      password: params.password,
    );
  }
}

class UserSignInParams {
  final String email;
  final String password;

  UserSignInParams({
    required this.email,
    required this.password,
  });
}
