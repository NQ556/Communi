import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/features/authentication/domain/entities/user.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signInWithEmail({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> signUpWithEmail({
    required String username,
    required String email,
    required String password,
  });
}
