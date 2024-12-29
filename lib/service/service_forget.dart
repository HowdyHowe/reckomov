import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reckomov_app/components/othercomponents/snackbar.dart';


Future<void> serviceForget(BuildContext context, email) async {
  var url = 'http://toba.flaskhost.my.id/userforget';

  Map<String, String> headers = {'Content-Type': 'application/json'};
  String jsonBody = jsonEncode({
    "email": email,
  });

  final response =
      await http.post(Uri.parse(url), headers: headers, body: jsonBody);

  if (response.statusCode == 202) {
    Navigator.pop(context);
    Navigator.pushReplacementNamed(context, '/login');
    showSnackBar(
        context, 'Kata sandi telah dikirim keemail yang anda gunakan.');
  } else if (response.statusCode == 400) {
    showSnackBar(context, 'isi semua kolom terlebih dahulu.');
  } else if (response.statusCode == 401) {
    showSnackBar(context, 'email tidak ada.');
  }
}
