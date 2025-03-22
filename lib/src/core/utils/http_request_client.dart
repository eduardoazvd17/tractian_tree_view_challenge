import 'package:http/http.dart' as http;

abstract class IHttpRequestClient {
  Future<http.Response> get(String url);
}

class HttpRequestClient extends IHttpRequestClient {
  final http.Client _client;
  HttpRequestClient() : _client = http.Client();

  @override
  Future<http.Response> get(String url) async {
    return await _client.get(Uri.parse(url));
  }
}
