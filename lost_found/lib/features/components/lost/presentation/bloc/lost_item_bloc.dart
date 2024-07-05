// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lost_found/features/components/lost/domain/usecases/upload_lost_item.dart';

// part 'lost_item_event.dart';
// part 'lost_item_state.dart';

// class LostItemBloc extends Bloc<LostItemEvent, LostItemState> {
//   UploadLostItem uploadLostItem;

//   LostItemBloc(this.uploadLostItem) : super(LostItemInitial()) {
//     on<LostItemEvent>((event, emit) => emit(LostItemLoading()));
//     on<LostItemReportStatus>(_onLostItemReportStatus);
//   }

//   void _onLostItemReportStatus(
//       LostItemReportStatus event, Emitter<LostItemState> emit) async {
//     final res = await uploadLostItem(
//       UploadLostItemParams(
//         userId: event.userId,
//         title: event.title,
//         description: event.description,
//         lostLocation: event.lostLocation,
//         lostItemImage: event.lostItemImage,
//         lostItemDate: event.lostItemDate,
//         lostItemTime: event.lostItemTime,
//         lostItemCategory: event.lostItemCategory,
//         claimed: event.claimed,
//       ),
//     );

//     res.fold(
//       (l) => emit(LostItemFailure(l.message)),
//       (r) => emit(LostItemSuccess()),
//     );
//   }
// }
