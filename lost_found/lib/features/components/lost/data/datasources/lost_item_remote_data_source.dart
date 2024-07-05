// import 'dart:io';
// import 'package:lost_found/core/error/exceptions.dart';
// import 'package:lost_found/features/components/lost/data/models/lost_item_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// abstract interface class LostItemRemoteDataSource {
//   Future<LostItemModel> recordLostItem(LostItemModel lostItem);
//   Future<String> uploadLostItemImage({
//     required File lostItemImage,
//     required LostItemModel lostItem,
//   });
// }

// class LostItemRemoteDataSourceImpl implements LostItemRemoteDataSource {
//   final SupabaseClient supabaseClient;
//   LostItemRemoteDataSourceImpl(this.supabaseClient);

//   @override
//   Future<LostItemModel> recordLostItem(LostItemModel lostItem) async {
//     try {
//       final lostItemData = await supabaseClient
//           .from('itemlost')
//           .insert(lostItem.toJson())
//           .select();

//       return LostItemModel.fromJson(lostItemData.first);
//     } on PostgrestException catch (e) {
//       throw ServerException(e.message);
//     } catch (e) {
//       throw ServerException(e.toString());
//     }
//   }

//   @override
//   Future<String> uploadLostItemImage({
//     required File lostItemImage,
//     required LostItemModel lostItem,
//   }) async {
//     try {
//       await supabaseClient.storage
//           .from('lost_items')
//           .upload(lostItem.id, lostItemImage);

//       return supabaseClient.storage
//           .from('lost_items')
//           .getPublicUrl(lostItem.id);
//     } catch (e) {
//       throw ServerException(e.toString());
//     }
//   }
// }
