// import 'dart:io';
// import 'package:connectivity_plus/connectivity_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:reckomov/components/appbar/appBar.dart';
// import 'package:reckomov/pages/accountpage.dart';
// import 'package:reckomov/pages/bookmarkpage.dart';
// import 'package:reckomov/pages/favoritepage.dart';
// import 'package:reckomov/pages/homepage.dart';

// class MainPage extends StatefulWidget {
//   const MainPage({
//     super.key,
//   });

//   @override
//   State<MainPage> createState() => _MainPageState();
// }

// class _MainPageState extends State<MainPage> {
//   int index = 0;
//   final page = [HomePage(), FavoritePage(), BookmarkPage(), AccountPage()];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: ResAppbar(),
//       body: page[index],
//       bottomNavigationBar: Container(
//         color: Color.fromARGB(255, 255, 255, 255),
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//           child: GNav(
//               backgroundColor: Color.fromARGB(255, 255, 255, 255),
//               color: const Color.fromARGB(255, 46, 54, 72),
//               activeColor: Color.fromARGB(255, 46, 54, 72),
//               tabBorder: Border.all(
//                   width: 3, color: Color.fromARGB(255, 255, 255, 255)),
//               tabActiveBorder:
//                   Border.all(width: 2, color: Color.fromARGB(255, 7, 4, 4)),
//               padding: EdgeInsets.all(15),
//               gap: 8,
//               onTabChange: (index) => setState(() {
//                     this.index = index;
//                   }),
//               tabs: [
//                 GButton(
//                   icon: Icons.home_max_outlined,
//                   text: "Home",
//                 ),
//                 GButton(
//                   icon: Icons.favorite_outline_outlined,
//                   text: "Favorite",
//                 ),
//                 GButton(
//                   icon: Icons.bookmark_add_outlined,
//                   text: "Bookmarks",
//                 ),
//                 GButton(
//                   icon: Icons.manage_accounts_outlined,
//                   text: "Account",
//                 )
//               ]),
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:reckomov_app/components/appbar/appbar.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:reckomov_app/pages/account_mainpage.dart';
import 'package:reckomov_app/pages/bookmark_mainpage.dart';
import 'package:reckomov_app/pages/favorit_mainpage.dart';
import 'package:reckomov_app/pages/home_mainpage.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key,
  });

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  bool isConnected = false;
  int index = 0;
  final page = [
    HomeMainPage(),
    FavoriteMainPage(),
    BookmarkMainPage(),
    AccountMainPage()
  ];
  StreamSubscription? _internetsub;

  @override
  void initState() {
    super.initState();
    _internetsub = InternetConnection().onStatusChange.listen((event) {
      switch (event) {
        case InternetStatus.connected:
          break;
        case InternetStatus.disconnected:
          _showNoConnectionDialog();
          break;
      }
    });
  }

  @override
  void dispose() {
    _internetsub?.cancel();
    super.dispose();
  }

  Future<void> _showNoConnectionDialog() async {
    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Tidak ada koneksi"),
          content: Text(
              "Anda tidak terhubung ke internet, apakah anda ingin keluar dari aplikasi?."),
          actions: [
            TextButton(
              onPressed: () async {
                bool stillDisconnected = await _checkInternetConnection();
                if (stillDisconnected) {
                  Navigator.of(context).pop();
                  await Future.delayed(Duration(seconds: 2));
                  _showNoConnectionDialog();
                } else {
                  Navigator.of(context).pop();
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/", (route) => false);
                }
              },
              child: Text("Muat ulang"),
            ),
            TextButton(
              onPressed: () {
                exit(0);
              },
              child: Text("Keluar"),
            ),
          ],
        );
      },
    );
  }

  Future<bool> _checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isEmpty || result[0].rawAddress.isEmpty;
    } on SocketException catch (_) {
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ResAppbar(),
      body: page[index],
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: GNav(
            backgroundColor: Color.fromARGB(255, 255, 255, 255),
            color: const Color.fromARGB(255, 46, 54, 72),
            activeColor: Color.fromARGB(255, 46, 54, 72),
            tabBorder:
                Border.all(width: 3, color: Color.fromARGB(255, 255, 255, 255)),
            tabActiveBorder:
                Border.all(width: 2, color: Color.fromARGB(255, 46, 54, 72)),
            padding: EdgeInsets.all(10),
            gap: 8,
            onTabChange: (index) => setState(() {
              this.index = index;
            }),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
