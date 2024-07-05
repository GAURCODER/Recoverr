// import 'dart:io';
// import 'package:fpdart/fpdart.dart';
// import 'package:lost_found/core/error/exceptions.dart';
// import 'package:lost_found/core/error/failures.dart';
// import 'package:lost_found/features/components/lost/data/datasources/lost_item_remote_data_source.dart';
// import 'package:lost_found/features/components/lost/data/models/lost_item_model.dart';
// import 'package:lost_found/features/components/lost/domain/entities/lost_item.dart';
// import 'package:lost_found/features/components/lost/domain/repository/lost_item_repository.dart';
// import 'package:uuid/uuid.dart';

// class LostItemRepositoryImpl implements LostItemRepository {
//   final LostItemRemoteDataSource lostItemRemoteDataSource;
//   LostItemRepositoryImpl(this.lostItemRemoteDataSource);

//   @override
//   Future<Either<Failure, LostItem>> uploadLostItem({
//     required String userId,
//     required String title,
//     required String description,
//     required String lostLocation,
//     required File lostItemImage,
//     required String lostItemDate,
//     required String lostItemTime,
//     required String lostItemCategory,
//     required bool claimed,
//   }) async {
//     try {
//       final generatedId = const Uuid().v1();

//       LostItemModel lostItemModel = LostItemModel(
//         id: generatedId,
//         userId: userId,
//         title: title,
//         description: description,
//         lostLocation: lostLocation,
//         lostItemImageUrl: "",
//         lostItemDate: lostItemDate,
//         lostItemTime: lostItemTime,
//         lostItemCategory: lostItemCategory,
//         claimed: claimed,
//         updatedAt: DateTime.now(),
//       );

//       final lostItemImageUrl =
//           await lostItemRemoteDataSource.uploadLostItemImage(
//         lostItemImage: lostItemImage,
//         lostItem: lostItemModel,
//       );

//       lostItemModel = lostItemModel.copyWith(
//         lostItemImageUrl: lostItemImageUrl,
//       );
//       final recordedLostItem =
//           await lostItemRemoteDataSource.recordLostItem(lostItemModel);

//       return right(recordedLostItem);
//     } on ServerException catch (e) {
//       throw left(Failure(e.message));
//     }
//   }
// }
