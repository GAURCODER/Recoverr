// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lost_found/features/components/found/domain/usecases/upload_found_item.dart';

// part 'found_item_event.dart';
// part 'found_item_state.dart';

// class FoundItemBloc extends Bloc<FoundItemEvent, FoundItemState> {
//   UploadFoundItem uploadFoundItem;

//   FoundItemBloc(this.uploadFoundItem) : super(FoundItemInitial()) {
//     on<FoundItemEvent>((event, emit) => emit(FoundItemLoading()));
//     on<FoundItemReportStatus>(_onFoundItemReportStatus);
//   }

//   void _onFoundItemReportStatus(
//       FoundItemReportStatus event, Emitter<FoundItemState> emit) async {
//     final res = await uploadFoundItem(UploadFoundItemParams(
//       userId: event.userId,
//       title: event.title,
//       description: event.description,
//       foundLocation: event.foundLocation,
//       foundItemImage: event.foundItemImage,
//       itemCollectionLocation: event.itemCollectionLocation,
//       itemCategory: event.itemCategory,
//     ));

//     res.fold(
//       (l) => emit(FoundItemFailure(l.message)),
//       (r) => emit(FoundItemSuccess()),
//     );
//   }
// }
