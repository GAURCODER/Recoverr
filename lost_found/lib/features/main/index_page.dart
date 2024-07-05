import 'package:flutter/material.dart';
import 'package:lost_found/features/main/pages/browse_item.dart';
import 'package:lost_found/features/main/pages/home_page.dart';
import 'package:lost_found/features/main/pages/personal_item.dart';
import 'package:lost_found/features/main/pages/splash_page.dart';
import 'package:lost_found/features/main/widgets/bottom_navigation_bar.dart';

class IndexPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const IndexPage());
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int selectedIndex = 0;

  List screenList = [
    const HomePage(),
    const BrowseItem(),
    const SplashPage(),
    const PersonalItems(),
  ];

  void onTabChange(int value) {
    setState(() {
      selectedIndex = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenList[selectedIndex],
      bottomNavigationBar: CustomBottomNavBar(
        onTabChange: onTabChange,
      ),
    );
  }
}
