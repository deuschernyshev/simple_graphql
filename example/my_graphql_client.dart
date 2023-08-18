import 'package:simple_graphql/simple_graphql.dart';

class MyGraphQLClient extends SimpleGraphQLClient {
  @override
  String baseUrl = 'https://rickandmortyapi.com/graphql';
  
  @override
  Map<String, String>? headers;
}
