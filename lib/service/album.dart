import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:learn_api/model/Album.dart';

Future<Album> fetchAlbum() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'albums'));

  if (response.statusCode == 200) {
    print(response.body);
    return Album.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed');
  }
}
