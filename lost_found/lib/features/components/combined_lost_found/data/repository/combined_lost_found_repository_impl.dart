import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/exceptions.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/features/components/combined_lost_found/data/datasources/combined_lost_found_remote_data_source.dart';
import 'package:lost_found/features/components/combined_lost_found/data/models/combined_lost_found_model.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/entities/combined_lost_found.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/repository/combined_lost_found_repository.dart';
import 'package:uuid/uuid.dart';

class CombinedLostFoundRepositoryImpl implements CombinedLostFoundRepository {
  final CombinedLostFoundRemoteSource combinedLostFoundRemoteSource;

  CombinedLostFoundRepositoryImpl(this.combinedLostFoundRemoteSource);

  @override
  Future<Either<Failure, int>> claimedCombinedLostFoundRepository({
    required String id,
    required String userId,
  }) async {
    try {
      final res = await combinedLostFoundRemoteSource.claimedItem(id, userId);

      if (res == 0) {
        return left(Failure("Item already claimed"));
      }
      if (res == 1) {
        return left(Failure("Item cannot be claimed - Server Error"));
      }

      return right(res);
    } catch (e) {
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, CombinedLostFound>> combinedLostFoundRepository({
    required String status,
    required String title,
    required String description,
    required String location,
    required File image,
    required String? lostDate,
    required String? lostTime,
    required String? collectionCenter,
    required String userId,
    required String category,
    required bool claimed,
    required String? claimedId,
    required DateTime? claimedTime,
  }) async {
    try {
      CombinedLostFoundModel combinedLostFoundModel = CombinedLostFoundModel(
        id: const Uuid().v1(),
        updatedAt: DateTime.now(),
        status: status,
        title: title,
        description: description,
        location: location,
        imageUrl: "",
        lostDate: lostDate,
        lostTime: lostTime,
        collectionCenter: collectionCenter,
        userId: userId,
        category: category,
        claimed: claimed,
        claimedId: claimedId,
        claimedTime: claimedTime,
      );

      final imageUrl = await combinedLostFoundRemoteSource.uploadImage(
          image: image, combinedLostFoundItem: combinedLostFoundModel);

      combinedLostFoundModel = combinedLostFoundModel.copyWith(
        imageUrl: imageUrl,
      );

      final uploadCombinedLostFound = await combinedLostFoundRemoteSource
          .uploadCombinedLostFound(combinedLostFoundModel);

      return right(uploadCombinedLostFound);
    } on ServerException catch (e) {
      return left(Failure(e.message));
    }
  }
}
