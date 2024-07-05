import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/common/cubit/app_user/app_user_cubit.dart';
import 'package:lost_found/core/common/widgets/loader.dart';
import 'package:lost_found/core/utils/show_snackbar.dart';
import 'package:lost_found/features/chats/presentation/rooms/user_interaction.dart';
import 'package:lost_found/features/components/backend/presentation/bloc/backend_information_bloc.dart';
import 'package:lost_found/features/main/index_page.dart';
import 'package:lost_found/features/main/widgets/title_bar.dart';
import 'package:lost_found/features/main/widgets/user_message_box.dart';

class SplashPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SplashPage());
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    context.read<BackendInformationBloc>().add(BackendProfileInformationBloc());
  }

  @override
  Widget build(BuildContext context) {
    final userId =
        (context.read<AppUserCubit>().state as AppUserLoggedIn).user.id;

    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TitleBar(
            title: "Messages",
            onTap: () {
              Navigator.push(context, IndexPage.route());
            },
          ),
          const SizedBox(height: 20),

          // Items Collection
          BlocConsumer<BackendInformationBloc, BackendInformationState>(
            listener: (context, state) {
              if (state is BackendInformationFailure) {
                showSnackBar(context, state.message);
              }
            },
            builder: (context, state) {
              if (state is BackendInformationLoading) {
                return const Loader();
              }
              if (state is BackendInformationProfileSuccess) {
                return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: state.profile.length,
                  itemBuilder: (context, index) {
                    final profileList = state.profile[index];

                    if (userId != profileList.id) {
                      return GestureDetector(
                        onTap: () async {
                          Navigator.push(
                            context,
                            UserInteraction.route(
                              userId,
                              profileList.id,
                              profileList.name,
                            ),
                          );
                        },
                        child: UserMessageBox(
                          imageUrl:
                              'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png',
                          userName: profileList.name,
                        ),
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                );
              }
              return const SizedBox();
            },
          ),
        ],
      ),
    );
  }
}
