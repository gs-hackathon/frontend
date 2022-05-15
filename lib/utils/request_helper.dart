import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:waste_product/utils/Prefs.dart';

class RequestHelper extends http.BaseClient {
  http.Client _httpClient = new http.Client();
  @override
  Future<http.StreamedResponse> send(http.BaseRequest request) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    request.headers.addAll({'x-access-token': sp.getString("token")});
    return _httpClient.send(request);
  }

  @override
  Future<http.Response> post(url,
      {Map<String, String> headers, body, Encoding encoding}) async {
    return _sendUnstreamed('POST', url, headers, body, encoding);
  }

  @override
  Future<http.Response> _sendUnstreamed(
      String method, url, Map<String, String> headers,
      [body, Encoding encoding]) async {
    var request = http.Request(method, _fromUriOrString(url));

    if (headers != null) request.headers.addAll(headers);
    if (encoding != null) request.encoding = encoding;
    if (body != null) {
      if (body is String) {
        request.body = body;
      } else if (body is List) {
        request.bodyBytes = body.cast<int>();
      } else if (body is Map) {
        request.bodyFields = body.cast<String, String>();
      } else {
        throw ArgumentError('Invalid request body "$body".');
      }
    }

    var responseData = await http.Response.fromStream(await send(request));
    return responseData;
  }

  Uri _fromUriOrString(uri) => uri is String ? Uri.parse(uri) : uri as Uri;

  Uri url(String urlPath) {
    final url = "http://10.22.23.236:8080/" + urlPath;
    return Uri.parse(url);
  }
}
