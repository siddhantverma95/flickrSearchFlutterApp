import 'package:flickr_search_app/core/models/search.dart';
import 'package:flickr_search_app/core/provider/search_provider.dart';
import 'package:flickr_search_app/ui/widgets/app_bar.dart';
import 'package:flickr_search_app/ui/widgets/search_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchView extends StatefulWidget {
  const SearchView({Key key}) : super(key: key);

  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController _textController;
  ScrollController _scrollController;

  @override
  void initState() {
    _textController = new TextEditingController();
    _scrollController = new ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchProvider = Provider.of<SearchProvider>(context);
    return Scaffold(
        body: NotificationListener<ScrollNotification>(
      onNotification: (notification) {
        if (notification.metrics.pixels ==
            notification.metrics.maxScrollExtent) {
          searchProvider.getPaginatedResults(_textController.text);
        }

        return false;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: <Widget>[
            AppBarWidget(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextFormField(
                  controller: _textController,
                  decoration: InputDecoration(labelText: 'Search'),
                  onFieldSubmitted: (text) {
                    searchProvider.getResults(text);
                  }),
            ),
            SizedBox(
              height: 16,
            ),
            !searchProvider.getIsLoading()
                ? !searchProvider.getIsError()
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 48),
                        child: GridView.builder(
                          controller: _scrollController,
                          shrinkWrap: true,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3),
                          itemCount: searchProvider.getList().length,
                          itemBuilder: (context, index) {
                            Photo obj =
                                searchProvider.getList().elementAt(index);
                            return SearchCard(
                              photo: obj,
                            );
                          },
                        ),
                      )
                    : Text('Something went wrong. Please try again later.')
                : CircularProgressIndicator(),
            searchProvider.getIsPaginating()
                ? CircularProgressIndicator()
                : Container(),
          ],
        ),
      ),
    ));
  }

  // void _onFieldSubmitted(String text){
  //   _searchBloc..add(search);
  // }

  Widget _buildLoaderListItem() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
