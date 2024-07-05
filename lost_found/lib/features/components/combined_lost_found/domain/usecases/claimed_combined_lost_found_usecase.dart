import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/core/usecase/usecase.dart';
// import 'package:lost_found/features/components/combined_lost_found/domain/entities/combined_lost_found.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/repository/combined_lost_found_repository.dart';

class ClaimedCombinedLostFoundUseCase
    implements UseCase<int, ClaimedCombinedLostFoundUseCaseParams> {
  final CombinedLostFoundRepository combinedLostFoundRepository;
  ClaimedCombinedLostFoundUseCase(this.combinedLostFoundRepository);

  @override
  Future<Either<Failure, int>> call(
      ClaimedCombinedLostFoundUseCaseParams params) async {
    return await combinedLostFoundRepository.claimedCombinedLostFoundRepository(
      id: params.id,
      userId: params.userId,
    );
  }
}

class ClaimedCombinedLostFoundUseCaseParams {
  final String id;
  final String userId;
  ClaimedCombinedLostFoundUseCaseParams({
    required this.id,
    required this.userId,
  });
}
