import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reckomov_app/components/othercomponents/snackbar.dart';

Future<void> saveUserData(String email) async {
  var storage = FlutterSecureStorage();
  await storage.write(key: "user", value: email);
}

Future<void> serviceLogin(
    BuildContext context, String email, String password) async {
  final String url = 'http://toba.flaskhost.my.id/user_login';
  Map<String, String> headers = {'Content-Type': 'application/json'};
  String jsonBody = jsonEncode({"email": email, "password": password});
  final response =
      await http.post(Uri.parse(url), headers: headers, body: jsonBody);

  if (response.statusCode == 201) {
    var storage = FlutterSecureStorage();
    await storage.write(key: "user", value: email);

    // final String url1 = 'http://10.0.2.2:5000/newuser/checking';
    final String url1 = 'http://toba.flaskhost.my.id/newuser/checking';
    Map<String, String> headers1 = {'Content-Type': 'application/json'};
    String jsonBody1 = jsonEncode({
      "id_film": 278,
      "email": email,
    });

    final response1 =
        await http.post(Uri.parse(url1), headers: headers1, body: jsonBody1);

    if (response1.statusCode == 201) {
      Navigator.pushReplacementNamed(context, '/new_user1');
    }
    if (response1.statusCode == 200) {
      Navigator.pushReplacementNamed(context, '/dashboard');
      showSnackBar(context, 'Selamat Datang.');
    }
  } else if (response.statusCode == 400) {
    showSnackBar(context, 'Isi semua kolom.');
  } else if (response.statusCode == 401) {
    showSnackBar(context, 'Username atau password salah.');
  } else if (response.statusCode == 402) {
    showSnackBar(context, 'Format email tidak valid.');
  } else if (response.statusCode == 403) {
    showSnackBar(context, 'Error.');
  }
}
