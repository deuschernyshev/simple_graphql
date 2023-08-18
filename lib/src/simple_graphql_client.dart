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

  /// Метод для отправки GraphQL запроса для изменения данных
  /// ```dart
  /// final client = SimpleGraphQLClient();
  /// final result = await client.mutation('{ createSong { addSong(title: "Город под подошвой", performer: "OXXXYMIRON") { id title performer } } }');
  /// ```
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
