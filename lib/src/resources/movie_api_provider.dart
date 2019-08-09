import 'dart:async';
import 'package:flutter_bloc_pattern_example/src/models/secret/secret_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';
import 'package:flutter/services.dart' show rootBundle;

class MovieApiProvider {
  Client client = Client();
  final _endpoint = 'http://api.themoviedb.org/3/movie/popular?api_key=';
  final _error = 'Failed to load post';
  final _page = '&page=1';

  Future<ItemModel> fetchMovieList() async {
    String secretsJson = await rootBundle.loadString('assets/secrets.json');
    String apiKey = SecretModel.fromJson(json.decode(secretsJson)).apiKey;
    final response = await client.get('$_endpoint$apiKey$_page');
    print(response.body.toString());
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return ItemModel.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception(_error);
    }
  }
}