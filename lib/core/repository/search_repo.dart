import 'package:flickr_search_app/core/network/api_base_helper.dart';
import 'package:flickr_search_app/utils/constants.dart';

class SearchRepository{
  Future<dynamic> getSearchResults(String text, String page) async{
    ApiBaseHelper apiBaseHelper = new ApiBaseHelper();
    try{
    final response = await apiBaseHelper.getRequest(REST, {
      'method': SEARCH_METHOD,
      'api_key': API_KEY,
      'text': text,
      'extras': EXTRAS,
      'per_page': PER_PAGE,
      'page': page,
      'format': FORMAT,
      'nojsoncallback': NO_JSON_CALLBACK
    });
    return response;
  }catch(e){
    return null;
  }
  }
}