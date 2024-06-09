import 'package:communi_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, String>> signInWithPhoneNumber({
    required String email,
    required String password,
  });

  Future<Either<Failure, String>> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  });
}
