import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reckomov_app/components/othercomponents/snackbar.dart';

Future<void> serviceSignin(
    BuildContext context, email, username, password, confirm_password) async {
  final String url = 'http://toba.flaskhost.my.id/user_signin';
  Map<String, String> headers = {'Content-Type': 'application/json'};
  String jsonBody = jsonEncode({
    "email": email,
    "username": username,
    "password": password,
    "confirm_password": confirm_password
  });

  final response =
      await http.post(Uri.parse(url), headers: headers, body: jsonBody);

  if (response.statusCode == 202) {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/login');
    showSnackBar(context, 'Akun telah berhasil dibuat.');
  } else if (response.statusCode == 400) {
    showSnackBar(context, 'Isi semua kolom terlebih dahulu.');
  } else if (response.statusCode == 401) {
    showSnackBar(context, 'Password tidak sama.');
  } else if (response.statusCode == 402) {
    showSnackBar(context, 'Email telah digunakan.');
  } else if (response.statusCode == 403) {
    showSnackBar(context, 'Format alamat email salah.');
  } else if (response.statusCode == 404) {
    showSnackBar(context, 'Kata sandi minimal 8 karakter.');
  } else if (response.statusCode == 405) {
    showSnackBar(
        context, 'Kata sandi harus memiliki kombinasi huruf dan angka.');
  }
}
