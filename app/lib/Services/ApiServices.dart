import 'dart:async';

import 'package:app/Models/types.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  String baseUrl = 'apismite.herokuapp.com';
  // String baseUrl = '5197-177-102-143-42.sa.ngrok.io';

  Future<http.Response> post(String request, String endPonint) {
    var url = Uri.https(baseUrl, endPonint);
    var headers = {'Content-Type': 'application/json'};
    
    return http.post(url, headers: headers, body: request);
  }
}
