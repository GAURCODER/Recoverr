// import 'package:fpdart/fpdart.dart';
// import 'package:lost_found/core/error/failures.dart';
// import 'package:lost_found/core/usecase/usecase.dart';
// import 'package:lost_found/features/components/lost/domain/entities/lost_item.dart';
// import 'package:lost_found/features/components/backend/domain/repository/backend_information_repository.dart';

// class BackendLostInformation implements UseCase<List<LostItem>, NoParams> {
//   final BackendInformationRepository backendInformationRepository;

//   BackendLostInformation(this.backendInformationRepository);

//   @override
//   Future<Either<Failure, List<LostItem>>> call(NoParams params) async {
//     return await backendInformationRepository.getLostItemInformation();
//   }
// }
