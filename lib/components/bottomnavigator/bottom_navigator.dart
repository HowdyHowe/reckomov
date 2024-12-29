import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromARGB(255, 255, 255, 255),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: GNav(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            color: const Color.fromARGB(255, 46, 54, 72),
            activeColor: Color.fromARGB(255, 46, 54, 72),
            tabBorder:
                Border.all(width: 3, color: Color.fromARGB(255, 255, 255, 255)),
            tabActiveBorder: Border.all(
                width: 1, color: const Color.fromARGB(255, 46, 54, 72)),
            padding: EdgeInsets.all(7),
            gap: 8,
            tabs: [
              GButton(
                icon: Icons.home_max_outlined,
                text: "Home",
              ),
              GButton(
                icon: Icons.favorite_outline_outlined,
                text: "Favorite",
              ),
              GButton(
                icon: Icons.bookmark_add_outlined,
                text: "Bookmarks",
              ),
              GButton(
                icon: Icons.manage_accounts_outlined,
                text: "Account",
              )
            ]),
      ),
    );
  }
}
