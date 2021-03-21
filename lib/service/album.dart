import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:learn_api/model/Album.dart';

List<Album> parseData(String responseBody) {
  var list = json.decode(responseBody) as List<dynamic>;
  List<Album> albums = list.map((model) => Album.fromJson(model)).toList();

  return albums;
}

Future<List<Album>> fetchAlbum() async {
  final response =
      await http.get(Uri.https('jsonplaceholder.typicode.com', 'posts'));

  if (response.statusCode == 200) {
    print(response.body);
    // return Album.fromJson(jsonDecode(response.body));

    return compute(parseData, response.body);
  } else {
    throw Exception('Failed');
  }
}
