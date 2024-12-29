import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ResAppbar extends StatelessWidget implements PreferredSizeWidget {
  ResAppbar({
    super.key,
  });

  @override
  Size get preferredSize => Size.fromHeight(60);

  Future<void> clearStoredData() async {
    var storage = FlutterSecureStorage();
    await storage.delete(key: "user");
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> dialogHapus(BuildContext context) async {
      return (await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text("Hapus"),
              content: Text("Apakah anda yakin ingin logout dari aplikasi?"),
              actions: [
                TextButton(
                  onPressed: () async {
                    final FlutterSecureStorage secureStorage =
                        FlutterSecureStorage();
                    await secureStorage.deleteAll();
                    Navigator.pushNamedAndRemoveUntil(
                        context, "/login", (route) => false);
                  },
                  child: Text("Ya"),
                ),
                TextButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  child: Text("Tidak"),
                ),
              ],
            ),
          )) ??
          false;
    }

    return AppBar(
      iconTheme: IconThemeData(color: Colors.black),
      title: Padding(
        padding: const EdgeInsets.all(0),
        child: Text(
          "MyApp",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w200,
            color: Colors.black,
          ),
        ),
      ),
      actions: [
        Container(
          margin: EdgeInsets.only(right: 15),
          child: IconButton(
              style: IconButton.styleFrom(
                backgroundColor: Color.fromARGB(0, 255, 255, 255),
                elevation: 0,
              ),
              onPressed: () async {
                dialogHapus(context);
              },
              icon: Icon(
                Icons.logout_rounded,
                color: Colors.black,
              )),
        ),
      ],
      elevation: 0.5,
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}
