import 'package:http/http.dart' as http;

class IpInfoApi {
  static Future<String?> getIPAddress() async {
    try {
      final url = Uri.parse('https://api.ipify.org');
      final response = await http.get(url);

      return response.statusCode == 200 ? response.body : null;
    } catch (e) {
      return null;
    }
  }
}
