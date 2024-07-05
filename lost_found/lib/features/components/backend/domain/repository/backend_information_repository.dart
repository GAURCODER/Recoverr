import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/common/entities/user.dart';
import 'package:lost_found/core/error/failures.dart';
// import 'package:lost_found/features/chats/domain/entities/chat.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/entities/combined_lost_found.dart';
// import 'package:lost_found/features/components/found/domain/entities/found_item.dart';
// import 'package:lost_found/features/components/lost/domain/entities/lost_item.dart';

abstract interface class BackendInformationRepository {
  // Future<Either<Failure, List<LostItem>>> getLostItemInformation();
  // Future<Either<Failure, List<FoundItem>>> getFoundItemInformation();
  Future<Either<Failure, List<CombinedLostFound>>> getItemInformation();
  Future<Either<Failure, List<User>>> getProfileInformation();
}
