import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top:48, bottom: 24, left: 24),
      
      alignment: Alignment.bottomLeft,
      child: Text('Flickr Search', style: TextStyle(fontWeight: FontWeight.w800, fontSize: 24),),
    );
  }
}