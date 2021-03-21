import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:learn_api/service/album.dart';

import 'model/Album.dart';

void main() {
// void main(List<String> arguments) async {
  // var url =
  //     Uri.https('www.googleapis.com', '/books/v1/volumes', {'q': '{http}'});

  // // Await the http get response, then decode the json-formatted response.
  // var response = await http.get(url);
  // if (response.statusCode == 200) {
  //   var jsonResponse = convert.jsonDecode(response.body);
  //   var itemCount = jsonResponse['totalItems'];
  //   print('Number of books about http: $itemCount.');
  // } else {
  //   print('Request failed with status: ${response.statusCode}.');
  // }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();

    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: FutureBuilder(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data.title);
            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            }

            return CircularProgressIndicator();
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => {},
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
