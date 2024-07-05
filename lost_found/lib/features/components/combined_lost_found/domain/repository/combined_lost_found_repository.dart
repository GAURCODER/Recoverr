import 'dart:io';
import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/entities/combined_lost_found.dart';

abstract interface class CombinedLostFoundRepository {
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
  });

  Future<Either<Failure, int>> claimedCombinedLostFoundRepository({
    required String id,
    required String userId,
  });
}
