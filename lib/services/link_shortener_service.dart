import 'dart:convert';
import 'package:http/http.dart' as http;

class LinkShortenerService {
  static const String _baseUrl = 'https://is.gd/create.php';

  static Future<String?> shortenUrl(String longUrl, {String? customAlias}) async {
    try {
      final Map<String, String> params = {
        'format': 'json',
        'url': longUrl,
      };

      if (customAlias != null && customAlias.isNotEmpty) {
        params['shorturl'] = customAlias;
      }

      final uri = Uri.parse(_baseUrl).replace(queryParameters: params);
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['shorturl'] != null) {
          return data['shorturl'];
        } else if (data['errormessage'] != null) {
          throw Exception(data['errormessage']);
        }
      }
      
      throw Exception('Failed to shorten URL');
    } catch (e) {
      throw Exception('Error shortening URL: $e');
    }
  }

  static bool isValidUrl(String url) {
    try {
      final uri = Uri.parse(url);
      return uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https');
    } catch (e) {
      return false;
    }
  }

  static String ensureHttpScheme(String url) {
    if (!url.startsWith('http://') && !url.startsWith('https://')) {
      return 'https://$url';
    }
    return url;
  }
}