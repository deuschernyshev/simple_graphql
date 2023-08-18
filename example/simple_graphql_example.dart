import 'my_graphql_client.dart';

Future<void> main() async {
  final client = MyGraphQLClient();

  const query = 
  '''
  {
    characters(page: 2, filter: { name: "Morty" }) {
      info {
        count
      }
      results {
        name
      }
    }
    location(id: 1) {
      id
    }
    episodesByIds(ids: [1, 2]) {
      id
    }
  }
  ''';

  final data = await client.query(query: query);

  print(data);
}
