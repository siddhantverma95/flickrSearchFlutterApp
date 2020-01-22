import 'package:flickr_search_app/core/provider/search_provider.dart';
import 'package:flickr_search_app/ui/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flickr Search',
      theme: ThemeData(
        
      ),
      home: ChangeNotifierProvider<SearchProvider>(
        create: (context)=> SearchProvider(),
        child: SearchView()),
    );
  }
}