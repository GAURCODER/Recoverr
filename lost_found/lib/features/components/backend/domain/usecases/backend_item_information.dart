import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/features/components/backend/domain/repository/backend_information_repository.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/entities/combined_lost_found.dart';

class BackendItemInformation implements UseCase<List<CombinedLostFound>, NoParams> {
  final BackendInformationRepository backendInformationRepository;

  BackendItemInformation(this.backendInformationRepository);

  @override
  Future<Either<Failure, List<CombinedLostFound>>> call(NoParams params) async {
    return await backendInformationRepository.getItemInformation();
  }
}