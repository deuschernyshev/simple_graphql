import 'my_graphql_client.dart';

Future<void> main() async {
  final client = MyGraphQLClient();

  const query = 'query {printers {list {...on Printer {name, id, model, host, port, delay}},}}';

  final data = await client.execute(query: query);

  print(data);
}
