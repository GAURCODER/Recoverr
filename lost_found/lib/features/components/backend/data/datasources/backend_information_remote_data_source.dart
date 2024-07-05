import 'package:lost_found/core/error/exceptions.dart';
import 'package:lost_found/features/auth/data/models/user_model.dart';
import 'package:lost_found/features/components/combined_lost_found/data/models/combined_lost_found_model.dart';
// import 'package:lost_found/features/components/found/data/models/found_item_model.dart';
// import 'package:lost_found/features/components/lost/data/models/lost_item_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class BackendInformationRemoteDataSource {
  // Future<List<LostItemModel>> getLostItemInformation();
  // Future<List<FoundItemModel>> getFoundItemInformation();
  Future<List<CombinedLostFoundModel>> getItemInformation();
  Future<List<UserModel>> getProfileInformation();
}

class BackendInformationRemoteDataSourceImpl
    implements BackendInformationRemoteDataSource {
  final SupabaseClient supabaseClient;

  BackendInformationRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<UserModel>> getProfileInformation() async {
    try {
      final profileInformation = await supabaseClient.from('profiles').select();

      return profileInformation
          .map((information) => UserModel.fromJson(information).copyWith())
          .toList();
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<CombinedLostFoundModel>> getItemInformation() async {
    try {
      final itemInformation = await supabaseClient
          .from('combined_database')
          .select('*, profiles (name, id)');

      return itemInformation
          .map(
            (information) =>
                CombinedLostFoundModel.fromJson(information).copyWith(
              posterName: information['profiles']['name'],
              posterId: information['profiles']['id'],
            ),
          )
          .toList();
    } on ServerException catch (e) {
      throw ServerException(e.toString());
    }
  }

  // @override
  // Future<List<LostItemModel>> getLostItemInformation() async {
  //   try {
  //     final lostItemInformation =
  //         await supabaseClient.from('itemlost').select('*, profiles (name)');

  //     return lostItemInformation
  //         .map(
  //           (information) => LostItemModel.fromJson(information).copyWith(
  //             posterName: information['profiles']['name'],
  //           ),
  //         )
  //         .toList();
  //   } on ServerException catch (e) {
  //     throw ServerException(e.toString());
  //   }
  // }

  // @override
  // Future<List<FoundItemModel>> getFoundItemInformation() async {
  //   try {
  //     final foundItemInformation =
  //         await supabaseClient.from('itemfound').select('*, profiles (name)');

  //     return foundItemInformation
  //         .map(
  //           (information) => FoundItemModel.fromJson(information).copyWith(
  //             posterName: information['profiles']['name'],
  //           ),
  //         )
  //         .toList();
  //   } on ServerException catch (e) {
  //     throw ServerException(e.message);
  //   }
  // }
}
