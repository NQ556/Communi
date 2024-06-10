import 'package:communi_app/core/error/failure.dart';
import 'package:communi_app/core/usecase/usecase.dart';
import 'package:communi_app/core/common/entities/user.dart';
import 'package:communi_app/features/authentication/domain/repository/auth_repository.dart';
import 'package:fpdart/src/either.dart';

class CurrentUser implements Usecase<User, NoParams> {
  final AuthRepository authRepository;
  CurrentUser(this.authRepository);

  @override
  Future<Either<Failure, User>> call(NoParams params) async {
    return await authRepository.currentUser();
  }
}
