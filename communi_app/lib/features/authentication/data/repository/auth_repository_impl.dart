import 'package:communi_app/core/error/exception.dart';
import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/features/authentication/data/datasources/auth_data_source.dart';
import 'package:communi_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource authDataSource;
  const AuthRepositoryImpl(this.authDataSource);

  @override
  Future<Either<Failure, String>> signInWithPhoneNumber(
      {required String email, required String password}) {
    // TODO: implement signInWithPhoneNumber
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> signUpWithEmail(
      {required String username,
      required String email,
      required String password}) async {
    try {
      final userId = await authDataSource.signUpWithEmail(
        username: username,
        email: email,
        password: password,
      );

      return right(userId);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
