import 'package:http/http.dart' as http;

abstract class IHttpClient {
  Future get({required String url});
}

class HttpClient implements IHttpClient {
  final client = http.Client();
  final String token = '9720bfda5d7f2b59b3598c333e173b27';
  @override
  Future get({required String url}) async {
    return await client
        .get(Uri.parse(url), headers: {'Authorization': 'Bearer $token'});
  }
}
