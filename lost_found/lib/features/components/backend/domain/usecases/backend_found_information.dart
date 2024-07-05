// import 'package:fpdart/fpdart.dart';
// import 'package:lost_found/core/error/failures.dart';
// import 'package:lost_found/core/usecase/usecase.dart';
// import 'package:lost_found/features/components/backend/domain/repository/backend_information_repository.dart';
// import 'package:lost_found/features/components/found/domain/entities/found_item.dart';

// class BackendFoundInformation implements UseCase<List<FoundItem>, NoParams> {
//   final BackendInformationRepository backendInformationRepository;

//   BackendFoundInformation(this.backendInformationRepository);

//   @override
//   Future<Either<Failure, List<FoundItem>>> call(NoParams params) async {
//     return await backendInformationRepository.getFoundItemInformation();
//   }
// }
