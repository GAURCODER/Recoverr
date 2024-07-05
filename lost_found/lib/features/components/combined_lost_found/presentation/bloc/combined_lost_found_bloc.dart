import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/usecases/claimed_combined_lost_found_usecase.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/usecases/combined_lost_found.dart';

part 'combined_lost_found_event.dart';
part 'combined_lost_found_state.dart';

class CombinedLostFoundBloc
    extends Bloc<CombinedLostFoundEvent, CombinedLostFoundState> {
  final CombinedLostFoundUseCase _combinedLostFoundUseCase;
  final ClaimedCombinedLostFoundUseCase _claimedCombinedLostFoundUseCase;

  CombinedLostFoundBloc({
    required CombinedLostFoundUseCase combinedLostFoundUseCase,
    required ClaimedCombinedLostFoundUseCase claimedCombinedLostFoundUseCase,
  })  : _combinedLostFoundUseCase = combinedLostFoundUseCase,
        _claimedCombinedLostFoundUseCase = claimedCombinedLostFoundUseCase,
        super(CombinedLostFoundInitial()) {
    on<CombinedLostFoundEvent>(
        (event, emit) => emit(CombinedLostFoundLoading()));
    on<CombinedLostFoundUploadBloc>(_onCombinedLostFoundReport);
    on<CombinedClaimedItemBloc>(_onUpdatedClaimed);
  }

  void _onUpdatedClaimed(CombinedClaimedItemBloc event,
      Emitter<CombinedLostFoundState> emit) async {
    final res = await _claimedCombinedLostFoundUseCase(
        ClaimedCombinedLostFoundUseCaseParams(
      id: event.id,
      userId: event.userId,
    ));

    res.fold((l) {
      emit(CombinedClaimedItemFailure(l.message));
    }, (r) {
      emit(CombinedClaimedItemSuccess());
    });
  }

  void _onCombinedLostFoundReport(CombinedLostFoundUploadBloc event,
      Emitter<CombinedLostFoundState> emit) async {
    final res = await _combinedLostFoundUseCase(CombinedLostFoundParams(
      status: event.status,
      title: event.title,
      description: event.description,
      location: event.location,
      image: event.image,
      lostDate: event.lostDate,
      lostTime: event.lostTime,
      collectionCenter: event.collectionCenter,
      userId: event.userId,
      category: event.category,
      claimed: event.claimed,
      claimedId: event.claimedId,
      claimedTime: event.claimedTime,
    ));

    res.fold(
      (l) => emit(CombinedLostFoundFailure(l.message)),
      (r) => emit(CombinedLostFoundSuccess()),
    );
  }
}
