import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:lost_found/core/theme/app_pallete.dart';

class CustomBottomNavBar extends StatelessWidget {
  final void Function(int) onTabChange;
  const CustomBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return GNav(
      gap: 8.0,
      activeColor: AppPallete.deepPurple,
      tabBackgroundColor: AppPallete.lightGrey,
      padding: const EdgeInsets.all(24),
      onTabChange: onTabChange,
      tabs: const [
        GButton(
          icon: Icons.home,
          text: "Home",
        ),
        GButton(
          icon: Icons.search,
          text: "Browse",
        ),
        GButton(
          icon: CupertinoIcons.chat_bubble_text,
          text: "Chat",
        ),
        GButton(
          icon: Icons.shopping_cart_checkout_rounded,
          text: "My Items",
        ),
      ],
    );
  }
}
