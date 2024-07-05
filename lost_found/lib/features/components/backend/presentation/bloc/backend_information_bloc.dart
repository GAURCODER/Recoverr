import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/entities/user.dart';
import 'package:lost_found/core/usecase/usecase.dart';
// import 'package:lost_found/features/chats/domain/entities/chat.dart';
// import 'package:lost_found/features/components/backend/domain/usecases/backend_found_information.dart';
import 'package:lost_found/features/components/backend/domain/usecases/backend_item_information.dart';
// import 'package:lost_found/features/components/backend/domain/usecases/backend_lost_information.dart';
import 'package:lost_found/features/components/backend/domain/usecases/backend_profile_information.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/entities/combined_lost_found.dart';
// import 'package:lost_found/features/components/found/domain/entities/found_item.dart';
// import 'package:lost_found/features/components/lost/domain/entities/lost_item.dart';

part 'backend_information_event.dart';
part 'backend_information_state.dart';

class BackendInformationBloc
    extends Bloc<BackendInformationEvent, BackendInformationState> {
  // final BackendLostInformation _getLostItemInformation;
  // final BackendFoundInformation _getFoundItemInformation;
  final BackendItemInformation _getItemInformation;
  final BackendProfileInformation _getProfileInformation;

  BackendInformationBloc({
    // required BackendLostInformation getLostItemInformation,
    // required BackendFoundInformation getFoundItemInformation,
    required BackendItemInformation getItemInformation,
    required BackendProfileInformation getProfileInformation,
  })  :
        // _getLostItemInformation = getLostItemInformation,
        // _getFoundItemInformation = getFoundItemInformation,
        _getItemInformation = getItemInformation,
        _getProfileInformation = getProfileInformation,
        super(BackendInformationInitial()) {
    on<BackendInformationEvent>(
        (event, emit) => emit(BackendInformationLoading()));
    // on<BackendLostInformationBloc>(_onFetchLostBackendInformation);
    // on<BackendFoundInformationBloc>(_onFetchFoundBackendInformation);
    on<BackendItemInformationBloc>(_onFetchBackendInformation);
    on<BackendProfileInformationBloc>(_onFetchProfileBackendInformation);
  }

  void _onFetchProfileBackendInformation(BackendProfileInformationBloc event,
      Emitter<BackendInformationState> emit) async {
    final res = await _getProfileInformation(NoParams());
    res.fold(
      (l) => emit(BackendInformationFailure(l.message)),
      (r) => emit(BackendInformationProfileSuccess(r)),
    );
  }

  void _onFetchBackendInformation(BackendItemInformationBloc event,
      Emitter<BackendInformationState> emit) async {
    final res = await _getItemInformation(NoParams());

    res.fold(
      (l) => emit(BackendInformationFailure(l.message)),
      (r) => emit(BackendInformationSuccess(r)),
    );
  }

  // void _onFetchLostBackendInformation(
  //   BackendLostInformationBloc event,
  //   Emitter<BackendInformationState> emit,
  // ) async {
  //   final res = await _getLostItemInformation(NoParams());

  //   res.fold(
  //     (l) => emit(BackendInformationFailure(l.message)),
  //     (r) => emit(BackendInformationLostSuccess(r)),
  //   );
  // }

  // void _onFetchFoundBackendInformation(
  //   BackendFoundInformationBloc event,
  //   Emitter<BackendInformationState> emit,
  // ) async {
  //   final res = await _getFoundItemInformation(NoParams());
  //   res.fold(
  //     (l) => emit(BackendInformationFailure(l.message)),
  //     (r) => emit(BackendInformationFoundSuccess(r)),
  //   );
  // }
}
