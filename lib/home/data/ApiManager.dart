import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/home/data/sports_response.dart';

import 'news_response.dart';
class ApiManager {
  static const String apiKey = '28fc86b130604d6f9c99ad8c84b89532';
  static const String baseUrl = 'newsapi.org';

  static Future<SportsResponse> loadNewsSources(String category) async {
    var params = {'apiKey': apiKey, 'category': category};
    var uri = Uri.https(baseUrl, '/v2/top-headlines/sources', params);
    var response = await http.get(uri);


    var sportsResponse = SportsResponse.fromJson(jsonDecode(response.body));//respnse body string json decode hat7wlha map ba3d kda ha7awlha l sports response
//sucess
    if (response.statusCode == 200) {
      return sportsResponse;
    }
// wsl lserver bs feh moshkla fe respnse nafso
    if (sportsResponse.message != null)
      throw Exception(sportsResponse.message);
// mawslsh lserver aslan
    throw Exception("error reaching server");
  }
  static Future<News_response> loadNews([String? sources, String? query]) async {
    var params = {'apiKey': apiKey, 'sources': sources, 'qInTitle': query};
    var uri = Uri.https(baseUrl, "/v2/everything", params);

    var response = await http.get(uri);
    var newsResponse = News_response.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      return newsResponse;
    }
    if (newsResponse.message != null) throw Exception(newsResponse.message);

    throw Exception("error connecting server");
  }


}