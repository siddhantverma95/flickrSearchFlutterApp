import 'dart:convert';

import 'package:flickr_search_app/core/models/search.dart';
import 'package:flickr_search_app/core/repository/search_repo.dart';
import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier {
  List<Photo> _list = new List();
  String _text;
  int _page = 1;
  bool _isLoading = false;
  bool _isPaginating = false;
  bool _isError = false;

  SearchProvider();

  bool getIsLoading() => _isLoading;
  bool getIsPaginating() => _isPaginating;
  bool getIsError()=> _isError;

  List<Photo> getList() => _list;

  void getResults(String text) async {
    _isLoading = true;
    notifyListeners();
    SearchRepository searchRepository = new SearchRepository();
    final response =
        await searchRepository.getSearchResults(text, _page.toString());
    if (response != null) {
      try {
        SearchResult searchResult =
            SearchResult.fromJson(json.decode(response.toString()));
        _list = searchResult.photos.photo;
        _page++;
        _isLoading = false;
        notifyListeners();
      } catch (e) {
        print("ERROR: $e");
      }
    } else {
      _isError = true;
      _isLoading = false;
      notifyListeners();
    }
  }

  void getPaginatedResults(String text) async {
    _isPaginating = true;
    notifyListeners();
    SearchRepository searchRepository = new SearchRepository();
    final response =
        await searchRepository.getSearchResults(text, _page.toString());
    _isPaginating = false;
    if (response != null) {
      try {
        SearchResult searchResult =
            SearchResult.fromJson(json.decode(response.toString()));
        _list.addAll(searchResult.photos.photo);
        _page++;
        notifyListeners();
      } catch (e) {
        print("ERROR: $e");
      }
    } else {}
  }
}
