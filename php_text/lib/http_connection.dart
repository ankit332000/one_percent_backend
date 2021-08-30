import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HTTPConnection {
  static getMethod() async {
    String url = "http://192.168.1.104/android/php_text/lib/get.php";
    var res = await http.get(Uri.parse(Uri.decodeFull(url)),
        headers: {"Accept": "application/json"});
    var responseBody = json.decode(res.body);
    print(responseBody);
    return responseBody;
  }
}
