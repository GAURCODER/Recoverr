import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/common/entities/user.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/features/components/backend/domain/repository/backend_information_repository.dart';

class BackendProfileInformation implements UseCase<List<User>, NoParams> {
  final BackendInformationRepository backendInformationRepository;

  BackendProfileInformation(this.backendInformationRepository);

  @override
  Future<Either<Failure, List<User>>> call(NoParams params) async {
    return await backendInformationRepository.getProfileInformation();
  }
}
