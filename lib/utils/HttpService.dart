import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class HttpService extends http.BaseClient {
  static final HttpService _httpService = HttpService._internal();
  final storage = new FlutterSecureStorage();

  Map<String, String> header = {
    'Content-Type': 'application/json',
    'accept': 'application/json'
  };

  factory HttpService() {
    return _httpService;
  }

  late final Client _client;

  @override
  Future<http.StreamedResponse> send(BaseRequest request) {
    header.forEach((key, value) {
      request.headers[key] = value;
    });

    return this._client.send(request);
  }

  Uri parseurl(String url) {
    return Uri.parse("http://10.0.2.2:8081/$url");
  }

  void logger(String method, String url) {
    print('[${method.toUpperCase().toString()}] ${parseurl(url).toString()}');
  }

  @override
  Future<Response> delete(url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    logger('delete', url.toString());
    return this._client.delete(parseurl(url.toString()),
        headers: header, body: body, encoding: encoding);
  }

  @override
  Future<Response> post(url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    logger('post', url.toString());
    return this._client.post(parseurl(url.toString()),
        headers: header, body: body, encoding: encoding);
  }

  @override
  Future<http.Response> get(url, {Map<String, String>? headers}) {
    logger('get', url.toString());
    return this._client.get(parseurl(url.toString()), headers: header);
  }

  @override
  Future<Response> put(url,
      {Map<String, String>? headers, Object? body, Encoding? encoding}) {
    logger('PUT', url.toString());
    return this._client.put(parseurl(url.toString()),
        headers: header, body: body, encoding: encoding);
  }

  void appendHeaders(String text) {
    header.putIfAbsent("Authorization", () => "Bearer " + text);
  }

  HttpService._internal() {
    _client = Client();
  }
}
