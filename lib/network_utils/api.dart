import 'dart:convert';
import 'package:docokana_new_app/models/real/articles_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network {
  final String _url = 'http://docokana.deve/api/v1';
  // final String _url = 'http://laravelpassport.deve/api/v1';

  var token;

  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    return await http.post(fullUrl,
        body: jsonEncode(data), headers: _setHeaders());
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;

    await _getToken();
    return await http.get(fullUrl, headers: _setHeaders());
  }

  Future<ArticlesModel> getArticles(apiUrl) async{
    var client = http.Client();
    var articlesModel;

    try{
      var fullUrl = _url + apiUrl;
      var response = await client.get(fullUrl);

      if(response.statusCode == 200){
        var jsonString = response.body;

        var jsonMap = json.decode(jsonString);

        print(jsonMap['articles']);

        articlesModel = ArticlesModel.fromJson(jsonMap);

      }
    } catch (Exception){
      return articlesModel;
    }

    return articlesModel;

  }

  _setHeaders() => {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
}
