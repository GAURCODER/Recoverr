// import 'dart:io';
// import 'package:fpdart/fpdart.dart';
// import 'package:lost_found/core/error/failures.dart';
// import 'package:lost_found/core/usecase/usecase.dart';
// import 'package:lost_found/features/components/found/domain/entities/found_item.dart';
// import 'package:lost_found/features/components/found/domain/repository/found_item_repository.dart';

// class UploadFoundItem implements UseCase<FoundItem, UploadFoundItemParams> {
//   final FoundItemRepository foundItemRepository;
//   UploadFoundItem(this.foundItemRepository);

//   @override
//   Future<Either<Failure, FoundItem>> call(UploadFoundItemParams params) async {
//     return await foundItemRepository.uploadFoundItem(
//       userId: params.userId,
//       title: params.title,
//       description: params.description,
//       foundLocation: params.foundLocation,
//       foundItemImage: params.foundItemImage,
//       itemCollectionLocation: params.itemCollectionLocation,
//       itemCategory: params.itemCategory,
//     );
//   }
// }

// class UploadFoundItemParams {
//   final String userId;
//   final String title;
//   final String description;
//   final String foundLocation;
//   final File foundItemImage;
//   final String itemCollectionLocation;
//   final String itemCategory;

//   UploadFoundItemParams({
//     required this.userId,
//     required this.title,
//     required this.description,
//     required this.foundLocation,
//     required this.foundItemImage,
//     required this.itemCollectionLocation,
//     required this.itemCategory,
//   });
// }
