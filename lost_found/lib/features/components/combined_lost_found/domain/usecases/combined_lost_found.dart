import 'dart:io';

import 'package:fpdart/fpdart.dart';
import 'package:lost_found/core/error/failures.dart';
import 'package:lost_found/core/usecase/usecase.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/entities/combined_lost_found.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/repository/combined_lost_found_repository.dart';

class CombinedLostFoundUseCase
    implements UseCase<CombinedLostFound, CombinedLostFoundParams> {
  final CombinedLostFoundRepository combinedLostFoundRepository;
  CombinedLostFoundUseCase(this.combinedLostFoundRepository);

  @override
  Future<Either<Failure, CombinedLostFound>> call(
      CombinedLostFoundParams params) async {
    return await combinedLostFoundRepository.combinedLostFoundRepository(
      status: params.status,
      title: params.title,
      description: params.description,
      location: params.location,
      image: params.image,
      lostDate: params.lostDate,
      lostTime: params.lostTime,
      collectionCenter: params.collectionCenter,
      userId: params.userId,
      category: params.category,
      claimed: params.claimed,
      claimedId: params.claimedId,
      claimedTime: params.claimedTime,
    );
  }
}

class CombinedLostFoundParams {
  final String status;
  final String title;
  final String description;
  final String location;
  final File image;
  final String? lostDate;
  final String? lostTime;
  final String? collectionCenter;
  final String userId;
  final String category;
  final bool claimed;
  final String? claimedId;
  final DateTime? claimedTime;

  CombinedLostFoundParams({
    required this.status,
    required this.title,
    required this.description,
    required this.location,
    required this.image,
    required this.lostDate,
    required this.lostTime,
    required this.collectionCenter,
    required this.userId,
    required this.category,
    required this.claimed,
    required this.claimedId,
    required this.claimedTime,
  });
}
