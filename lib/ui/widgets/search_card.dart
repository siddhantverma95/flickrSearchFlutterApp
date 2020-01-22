import 'package:flickr_search_app/core/models/search.dart';
import 'package:flutter/material.dart';

class SearchCard extends StatelessWidget {
  const SearchCard({Key key, @required this.photo}) : super(key: key);
  final Photo photo;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        child: GridTile(
          child: photo.urlO != null ? Image.network(photo.urlO, fit: BoxFit.cover,) :
          Center(child: Text('No Image Found'),),
        ),
      ),
    );
  }
}