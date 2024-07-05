import 'package:lost_found/core/error/failures.dart';
import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/common/entities/user.dart';

abstract interface class AuthRepository {
  Future<Either<Failure, User>> signUpWithEmailPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> loginWithEmailPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> currentUser();
  Future<Either<Failure, void>> signOut();
}
