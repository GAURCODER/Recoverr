// import 'dart:io';
// import 'package:lost_found/core/error/exceptions.dart';
// import 'package:lost_found/features/components/found/data/models/found_item_model.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';

// abstract interface class FoundItemRemoteDataSource {
//   Future<FoundItemModel> recordFoundItem(FoundItemModel foundItem);
//   Future<String> uploadFoundItemImage({
//     required File foundItemImage,
//     required FoundItemModel foundItem,
//   });
// }

// class FoundItemRemoteDataSourceImpl implements FoundItemRemoteDataSource {
//   final SupabaseClient supabaseClient;
//   FoundItemRemoteDataSourceImpl(this.supabaseClient);

//   @override
//   Future<FoundItemModel> recordFoundItem(FoundItemModel foundItem) async {
//     try {
//       final foundItemData = await supabaseClient
//           .from('itemfound')
//           .insert(foundItem.toJson())
//           .select();

//       return FoundItemModel.fromJson(foundItemData.first);
//     } catch (e) {
//       throw ServerException(e.toString());
//     }
//   }

//   @override
//   Future<String> uploadFoundItemImage({
//     required File foundItemImage,
//     required FoundItemModel foundItem,
//   }) async {
//     try {
//       await supabaseClient.storage
//           .from('found_items')
//           .upload(foundItem.id, foundItemImage);

//       return supabaseClient.storage
//           .from('found_items')
//           .getPublicUrl(foundItem.id);
//     } catch (e) {
//       throw ServerException(e.toString());
//     }
//   }
// }
