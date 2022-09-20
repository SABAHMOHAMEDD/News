import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/api/SoursesResponse.dart';
import 'package:news_app/home/NewsResponse.dart';


class ApiManager {

  static const String Base_Url = 'newsapi.org';
  static const String apiKey = 'cd0d5145f7e1437d86b43537b06d28a7';

  static Future<SoursesResponse> getNewsSourses() async {
    var uri = Uri.https(Base_Url, '/v2/top-headlines/sources',
        {"apiKey": apiKey, "category": "sports"});
    var response = await http.get(uri);
    var responseBody = response.body;
    var json = jsonDecode(responseBody);
    var soursesResponse = SoursesResponse.fromJson(json);
    return soursesResponse;
  }

  static Future<NewsResponse> getNewsBySourseId(String? sourceId) async {
    var uri = Uri.https(
        Base_Url, '/v2/everything', {"apiKey": apiKey, "sources": sourceId});
    var response = await http.get(uri);
    var json = jsonDecode(response.body);
    var newsResponse = NewsResponse.fromJson(json);
    return newsResponse;
  }
}
