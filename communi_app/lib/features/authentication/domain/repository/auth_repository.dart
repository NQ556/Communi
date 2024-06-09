import 'package:communi_app/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AuthRepository {
  Either<Failure, String> signInWithPhoneNumber({
    required String phoneNumber,
    required String password,
  });
}
