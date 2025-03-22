import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future<http.Response> get(String url);
}

class HttpClient extends IHttpClient {
  final http.Client _client;
  HttpClient() : _client = http.Client();

  @override
  Future<http.Response> get(String url) async {
    return await _client.get(Uri.parse(url));
  }
}
