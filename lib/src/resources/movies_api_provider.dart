import 'dart:async';
import 'package:flutter_bloc_pattern_example/src/models/secret/secret_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/movies_response.dart';
import 'package:flutter/services.dart' show rootBundle;

class MoviesApiProvider {
  Client client = Client();
  final _endpoint = 'http://api.themoviedb.org/3/movie/popular?api_key=';
  final _error = 'Failed to load post';
  //final _page = '&page=1';
  final _page = '';

  Future<MoviesResponse> fetchMovieList() async {
    String secretsJson = await rootBundle.loadString('assets/secrets.json');
    String apiKey = SecretModel.fromJson(json.decode(secretsJson)).apiKey;
    final response = await client.get('$_endpoint$apiKey$_page');
    print(response.body.toString());
    if (response.statusCode == 200) {
      return MoviesResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception(_error);
    }
  }
}