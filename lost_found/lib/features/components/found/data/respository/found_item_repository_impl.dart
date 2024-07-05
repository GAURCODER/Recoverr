// import 'dart:io';
// import 'package:fpdart/fpdart.dart';
// import 'package:lost_found/core/error/exceptions.dart';
// import 'package:lost_found/core/error/failures.dart';
// import 'package:lost_found/features/components/found/data/datasources/found_item_remote_data_source.dart';
// import 'package:lost_found/features/components/found/data/models/found_item_model.dart';
// import 'package:lost_found/features/components/found/domain/entities/found_item.dart';
// import 'package:lost_found/features/components/found/domain/repository/found_item_repository.dart';
// import 'package:uuid/uuid.dart';

// class FoundItemRepositoryImpl implements FoundItemRepository {
//   final FoundItemRemoteDataSource foundItemRemoteDataSource;

//   FoundItemRepositoryImpl(this.foundItemRemoteDataSource);

//   @override
//   Future<Either<Failure, FoundItem>> uploadFoundItem({
//     required String userId,
//     required String title,
//     required String description,
//     required String foundLocation,
//     required File foundItemImage,
//     required String itemCollectionLocation,
//     required String itemCategory,
//   }) async {
//     try {
//       final generatedId = const Uuid().v1();

//       FoundItemModel foundItemModel = FoundItemModel(
//         id: generatedId,
//         updatedAt: DateTime.now(),
//         userId: userId,
//         title: title,
//         description: description,
//         foundLocation: foundLocation,
//         foundItemImageUrl: "",
//         itemCollectionLocation: itemCollectionLocation,
//         itemCategory: itemCategory,
//         claimed: false,
//       );

//       final foundItemImageUrl =
//           await foundItemRemoteDataSource.uploadFoundItemImage(
//         foundItemImage: foundItemImage,
//         foundItem: foundItemModel,
//       );

//       foundItemModel = foundItemModel.copyWith(
//         foundItemImageUrl: foundItemImageUrl,
//       );

//       final recordFoundItem =
//           await foundItemRemoteDataSource.recordFoundItem(foundItemModel);
//       return right(recordFoundItem);
//     } on ServerException catch (e) {
//       return left(Failure(e.message));
//     }
//   }
// }
