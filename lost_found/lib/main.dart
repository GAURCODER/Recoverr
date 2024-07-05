import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lost_found/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lost_found/features/auth/presentation/pages/login.dart';
import 'package:lost_found/features/chats/presentation/bloc/user_chats_bloc.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
import 'package:lost_found/features/components/combined_lost_found/presentation/bloc/combined_lost_found_bloc.dart';
// import 'package:lost_found/features/components/found/presentation/bloc/found_item_bloc.dart';
// import 'package:lost_found/features/components/lost/presentation/bloc/lost_item_bloc.dart';
import 'package:lost_found/features/main/index_page.dart';
import 'package:lost_found/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AppUserCubit>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<CombinedLostFoundBloc>(),
      ),
      // BlocProvider(
      //   create: (_) => serviceLocator<LostItemBloc>(),
      // ),
      // BlocProvider(
      //   create: (_) => serviceLocator<FoundItemBloc>(),
      // ),
      BlocProvider(
        create: (_) => serviceLocator<BackendInformationBloc>(),
      ),
      BlocProvider(
        create: (_) => serviceLocator<UserChatsBloc>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocSelector<AppUserCubit, AppUserState, bool>(
          selector: (state) {
            return state is AppUserLoggedIn;
          },
          builder: (context, isLoggedIn) {
            if (isLoggedIn) {
              return const IndexPage();
            }
            return const Login();
          },
        ),
      ),
    );
  }
}
