import 'package:communi_app/core/error/exception.dart';
import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/features/authentication/data/datasources/auth_data_source.dart';
import 'package:communi_app/features/authentication/domain/entities/user.dart';
import 'package:communi_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  const AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<Failure, User>> signInWithEmail(
      {required String email, required String password}) async {
    return _getUser(
      () async => await authDataSource.signInWithEmail(
        email: email,
        password: password,
      ),
    );
  }

  @override
  Future<Either<Failure, User>> signUpWithEmail(
      {required String username,
      required String email,
      required String password}) async {
    return _getUser(
      () async => await authDataSource.signUpWithEmail(
        username: username,
        email: email,
        password: password,
      ),
    );
  }

  Future<Either<Failure, User>> _getUser(
    Future<User> Function() function,
  ) async {
    try {
      final user = await function();
      return right(user);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
