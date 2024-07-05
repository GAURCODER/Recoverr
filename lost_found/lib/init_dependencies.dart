import 'package:get_it/get_it.dart';
import 'package:lost_found/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lost_found/core/secrets/supabase_secrets.dart';
import 'package:lost_found/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:lost_found/features/auth/data/repository/auth_repository_impl.dart';
import 'package:lost_found/features/auth/domain/repository/auth_repository.dart';
import 'package:lost_found/features/auth/domain/usecases/current_user.dart';
import 'package:lost_found/features/auth/domain/usecases/sign_out.dart';
import 'package:lost_found/features/auth/domain/usecases/user_login.dart';
import 'package:lost_found/features/auth/domain/usecases/user_sign_up.dart';
import 'package:lost_found/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lost_found/features/chats/data/datasources/chat_remote_data_source.dart';
import 'package:lost_found/features/chats/data/repository/chat_repository_impl.dart';
import 'package:lost_found/features/chats/domain/repository/chat_repository.dart';
// import 'package:lost_found/features/chats/domain/usecases/chat_information.dart';
// import 'package:lost_found/features/chats/domain/usecases/chat_streaming_usecase.dart';
import 'package:lost_found/features/chats/domain/usecases/chat_usecase.dart';
import 'package:lost_found/features/chats/presentation/bloc/user_chats_bloc.dart';
import 'package:lost_found/features/components/backend/data/datasources/backend_information_remote_data_source.dart';
// import 'package:lost_found/features/components/backend/domain/usecases/backend_found_information.dart';
import 'package:lost_found/features/components/backend/domain/usecases/backend_item_information.dart';
import 'package:lost_found/features/components/backend/domain/usecases/backend_profile_information.dart';
import 'package:lost_found/features/components/combined_lost_found/data/datasources/combined_lost_found_remote_data_source.dart';
import 'package:lost_found/features/components/combined_lost_found/data/repository/combined_lost_found_repository_impl.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/repository/combined_lost_found_repository.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/usecases/claimed_combined_lost_found_usecase.dart';
import 'package:lost_found/features/components/combined_lost_found/domain/usecases/combined_lost_found.dart';
import 'package:lost_found/features/components/combined_lost_found/presentation/bloc/combined_lost_found_bloc.dart';
// import 'package:lost_found/features/components/found/data/datasources/found_item_remote_data_source.dart';
// import 'package:lost_found/features/components/lost/data/datasources/lost_item_remote_data_source.dart';
import 'package:lost_found/features/components/backend/data/repository/backend_information_repository_impl.dart';
// import 'package:lost_found/features/components/found/data/respository/found_item_repository_impl.dart';
// import 'package:lost_found/features/components/lost/data/respository/lost_item_repository_impl.dart';
import 'package:lost_found/features/components/backend/domain/repository/backend_information_repository.dart';
// import 'package:lost_found/features/components/found/domain/repository/found_item_repository.dart';
// import 'package:lost_found/features/components/lost/domain/repository/lost_item_repository.dart';
// import 'package:lost_found/features/components/backend/domain/usecases/backend_lost_information.dart';
// import 'package:lost_found/features/components/found/domain/usecases/upload_found_item.dart';
// import 'package:lost_found/features/components/lost/domain/usecases/upload_lost_item.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
// import 'package:lost_found/features/components/found/presentation/bloc/found_item_bloc.dart';
// import 'package:lost_found/features/components/lost/presentation/bloc/lost_item_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  _intitAuth();
  _initCombinedLostFound();
  // _initLostItem();
  // _initFoundItem();
  _initBackendInformation();
  _initChatMessages();

  final supabase = await Supabase.initialize(
    url: SupaBaseSecrets.url,
    anonKey: SupaBaseSecrets.anonKey,
  );
  serviceLocator.registerLazySingleton(() => supabase.client);

  serviceLocator.registerLazySingleton(() => AppUserCubit());
}

void _intitAuth() {
  serviceLocator.registerFactory<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory<AuthRepository>(
    () => AuthRepositoryImpl(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserSignUp(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => UserLogin(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => CurrentUser(
      serviceLocator(),
    ),
  );

  serviceLocator.registerFactory(
    () => SignOut(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => AuthBloc(
      userSignUp: serviceLocator(),
      userLogin: serviceLocator(),
      currentUser: serviceLocator(),
      appUserCubit: serviceLocator(),
      signOut: serviceLocator(),
    ),
  );
}

void _initCombinedLostFound() {
  serviceLocator.registerFactory<CombinedLostFoundRemoteSource>(
      () => CombinedLostFoundRemoteSourceImpl(serviceLocator()));

  serviceLocator.registerFactory<CombinedLostFoundRepository>(
      () => CombinedLostFoundRepositoryImpl(serviceLocator()));

  serviceLocator.registerFactory(
    () => CombinedLostFoundUseCase(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => ClaimedCombinedLostFoundUseCase(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => CombinedLostFoundBloc(
      combinedLostFoundUseCase: serviceLocator(),
      claimedCombinedLostFoundUseCase: serviceLocator(),
    ),
  );
}

// void _initLostItem() {
//   serviceLocator.registerFactory<LostItemRemoteDataSource>(
//     () => LostItemRemoteDataSourceImpl(
//       serviceLocator(),
//     ),
//   );

//   serviceLocator.registerFactory<LostItemRepository>(
//     () => LostItemRepositoryImpl(
//       serviceLocator(),
//     ),
//   );

//   serviceLocator.registerFactory(
//     () => UploadLostItem(
//       serviceLocator(),
//     ),
//   );

//   serviceLocator.registerLazySingleton(
//     () => LostItemBloc(
//       serviceLocator(),
//     ),
//   );
// }

// void _initFoundItem() {
//   serviceLocator.registerFactory<FoundItemRemoteDataSource>(
//     () => FoundItemRemoteDataSourceImpl(serviceLocator()),
//   );

//   serviceLocator.registerFactory<FoundItemRepository>(
//     () => FoundItemRepositoryImpl(serviceLocator()),
//   );

//   serviceLocator.registerFactory(
//     () => UploadFoundItem(serviceLocator()),
//   );

//   serviceLocator.registerLazySingleton(
//     () => FoundItemBloc(serviceLocator()),
//   );
// }

void _initBackendInformation() {
  serviceLocator.registerFactory<BackendInformationRemoteDataSource>(
      () => BackendInformationRemoteDataSourceImpl(serviceLocator()));

  serviceLocator.registerFactory<BackendInformationRepository>(
      () => BackendInformationRepositoryImpl(serviceLocator()));

  // serviceLocator.registerFactory(
  //   () => BackendLostInformation(serviceLocator()),
  // );

  // serviceLocator.registerFactory(
  //   () => BackendFoundInformation(serviceLocator()),
  // );

  serviceLocator.registerFactory(
    () => BackendItemInformation(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => BackendProfileInformation(serviceLocator()),
  );

  serviceLocator.registerLazySingleton(
    () => BackendInformationBloc(
      // getLostItemInformation: serviceLocator(),
      // getFoundItemInformation: serviceLocator(),
      getItemInformation: serviceLocator(),
      getProfileInformation: serviceLocator(),
    ),
  );
}

void _initChatMessages() {
  serviceLocator.registerFactory<ChatRemoteDataSource>(
    () => ChatRemoteDataSourceImpl(serviceLocator()),
  );

  serviceLocator.registerFactory<ChatRepository>(
    () => ChatRepositoryImpl(serviceLocator()),
  );

  serviceLocator.registerFactory(
    () => ChatUsecase(serviceLocator()),
  );

  // serviceLocator.registerFactory(
  //   () => ChatInformation(serviceLocator()),
  // );

  // serviceLocator.registerFactory(
  //   () => ChatStreamingUseCase(serviceLocator()),
  // );

  serviceLocator.registerLazySingleton(
    () => UserChatsBloc(
      chatUsecase: serviceLocator(),
      // chatInformation: serviceLocator(),
      // chatStream: serviceLocator(),
    ),
  );
}
