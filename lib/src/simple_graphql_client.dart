import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class SimpleGraphQLClient {
  /// Базовый URL
  abstract String baseUrl;

  /// HTTP заголовки
  abstract Map<String, String>? headers;

  Uri get _uri => Uri.parse(baseUrl);

  /// Метод для отправки GraphQL запроса для получения данных
  /// ```dart
  /// final client = SimpleGraphQLClient();
  /// final result = await client.query('{ person(id: 10) { name age } }');
  Future<dynamic> execute({required String query}) async {
    final Map<String, dynamic> body = {
      'query': query,
      'variables': null,
    };

    final response = await http.post(
      _uri,
      body: body,
      headers: headers,
    );

    return jsonDecode(response.body);
  }
}
