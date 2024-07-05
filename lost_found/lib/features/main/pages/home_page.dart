import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lost_found/core/theme/app_pallete.dart';
import 'package:lost_found/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:lost_found/features/main/widgets/information_about_app.dart';
import 'package:lost_found/features/main/widgets/last_reported_items.dart';
import 'package:lost_found/features/main/widgets/report_item_container.dart';
import 'package:lost_found/features/main/widgets/welcome_bar.dart';

class HomePage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const HomePage());
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<AuthBloc>().add(AuthIsUserLoggedIn());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 15,
              color: AppPallete.deepPurple,
            ),
            const WelcomeBar(),
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 3),
              child: Column(
                children: [
                  ReportItemContainer(),
                  InformationAboutApp(),
                ],
              ),
            ),
            Container(
              height: 20,
              width: double.infinity,
              color: AppPallete.greyShade200,
            ),
            const LastReportedItems(),
          ],
        ),
      ),
    );
  }
}
