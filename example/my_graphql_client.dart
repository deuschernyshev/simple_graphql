import 'package:simple_graphql/simple_graphql.dart';

class MyGraphQLClient extends SimpleGraphQLClient {
  @override
  String baseUrl = 'http://192.168.10.51:4000/api';
  
  @override
  Map<String, String>? headers;
}
