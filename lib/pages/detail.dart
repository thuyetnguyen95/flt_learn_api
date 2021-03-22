import 'package:flutter/material.dart';
import 'package:learn_api/model/Album.dart';

class DetailPage extends StatelessWidget {
  final Album album;
  DetailPage(this.album);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(album.title),
      ),
      body: Container(
        padding: EdgeInsets.all(6.0),
        child: Column(
          children: [
            Text(
              album.title,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                decoration: TextDecoration.underline,
              ),
            ),
            Text(album.body),
          ],
        ),
      ),
    );
  }
}
