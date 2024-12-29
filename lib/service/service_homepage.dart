import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:reckomov_app/components/othercomponents/snackbar.dart';
import 'package:reckomov_app/dataclass/dataclass_homepage.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

Future<String?> getEmail() async {
  var storage = FlutterSecureStorage();
  var email = await storage.read(key: "user");
  return email;
}

Future serviceHomePage(mpList, String type) async {
  try {
    if (mpList.length < 10) {
      // var test = await http.get(Uri.http('toba.flaskhost.my.id', 'homepage'));
      // var jsondecode = jsonDecode(test.body);
      String? email = await getEmail();
      final String url = 'http://toba.flaskhost.my.id/homepage';

      Map<String, String> headers = {'Content-Type': 'application/json'};
      String jsonBody = jsonEncode({"email": email});

      final response =
          await http.post(Uri.parse(url), headers: headers, body: jsonBody);

      var jsondecode = jsonDecode(response.body);

      for (var mp in jsondecode[type]) {
        final mostpop = DataClassHomepage(
            id: mp['id'],
            original_language: mp['original_language'].toString(),
            original_title: mp['original_title'].toString(),
            overview: mp['overview'].toString(),
            poster_path: mp['poster_path'].toString(),
            relase_data: mp['relase_data'].toString(),
            tmdbrate: mp['vote_average'].toString(),
            release_date: mp['release_date'].toString());
        mpList.add(mostpop);
      }
    }
  } catch (err) {}
}

Future serviceHomePagecheker(BuildContext context, mpList, String type) async {
  try {
    if (mpList.length < 10) {
      // var test = await http.get(Uri.http('toba.flaskhost.my.id', 'homepage'));
      // var jsondecode = jsonDecode(test.body);

      String? email = await getEmail();
      final String url = 'http://toba.flaskhost.my.id/homepage';

      Map<String, String> headers = {'Content-Type': 'application/json'};
      String jsonBody = jsonEncode({"email": email});

      final response =
          await http.post(Uri.parse(url), headers: headers, body: jsonBody);

      var jsondecode = jsonDecode(response.body);

      for (var mp in jsondecode[type]) {
        final mostpop = DataClassHomepage(
            id: mp['id'],
            original_language: mp['original_language'].toString(),
            original_title: mp['original_title'].toString(),
            overview: mp['overview'].toString(),
            poster_path: mp['poster_path'].toString(),
            relase_data: mp['relase_data'].toString(),
            tmdbrate: mp['vote_average'].toString(),
            release_date: mp['release_date'].toString());
        mpList.add(mostpop);
      }
    }
  } catch (err) {
    showSnackBar(context, "Koneksi internet terputus.");
  }
}
