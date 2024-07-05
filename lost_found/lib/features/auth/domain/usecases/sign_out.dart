import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/features/auth/domain/repository/auth_repository.dart';

class SignOut implements UseCase<void, NoParams> {
  final AuthRepository authRepository;
  SignOut(this.authRepository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await authRepository.signOut();
  }
}
