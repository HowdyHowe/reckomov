import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:reckomov_app/components/othercomponents/snackbar.dart';
import 'package:reckomov_app/dataclass/dataclass_account.dart';

Future<String?> getEmail() async {
  var storage = FlutterSecureStorage();
  var email = await storage.read(key: "user");
  return email;
}

Future serviceAccount(list) async {
  list.clear();

  final FlutterSecureStorage storage = FlutterSecureStorage();
  var email = await storage.read(key: "user");
  var test =
      await http.get(Uri.http('toba.flaskhost.my.id', 'user_data/$email'));
  var jsondecode = jsonDecode(test.body);

  final data = DataClassAccount(
      email: jsondecode[1],
      username: jsondecode[0],
      preferensi: jsondecode[3],
      password: jsondecode[2]);
  list.add(data);
}

Future<void> serviceEditAccount(
    BuildContext context, password, username) async {
  try {
    String? email = await getEmail();
    final String url = 'http://toba.flaskhost.my.id/user_update';

    Map<String, String> headers = {'Content-Type': 'application/json'};
    String jsonBody = jsonEncode(
        {"email": email, "username": username, "password": password});

    final response =
        await http.post(Uri.parse(url), headers: headers, body: jsonBody);

    if (response.statusCode == 201) {
      Navigator.pop(context);
      showSnackBar(context, 'data telah diperbarui.');
    } else if (response.statusCode == 400) {
      showSnackBar(context, 'isi semua kolom terlebih dahulu.');
    } else if (response.statusCode == 401) {
      showSnackBar(context, 'tidak ada data yang dirubah.');
    } else if (response.statusCode == 402) {
      showSnackBar(context, 'kata sandi minimal 8 karakter.');
    } else if (response.statusCode == 403) {
      showSnackBar(context, 'eror.');
    }
  } catch (e) {
    showSnackBar(context, 'Koneksi internet terputus.');
  }
}
