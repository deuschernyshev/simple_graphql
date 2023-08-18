import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class SimpleGraphQLClient {
  abstract String baseUrl;
  abstract Map<String, String>? headers;

  Uri get _uri => Uri.parse(baseUrl);

  Future<dynamic> query({required String query}) async {
    final response = await http.post(
      _uri,
      body: {
        'query': query.replaceAll(' ', ''),
      },
      headers: headers,
    );

    return jsonDecode(response.body);
  }

  Future<dynamic> mutation({required String query}) async {
    final response = await http.post(
      _uri,
      body: {
        'mutation': query.replaceAll(' ', ''),
      },
      headers: headers,
    );

    return jsonDecode(response.body);
  }
}
