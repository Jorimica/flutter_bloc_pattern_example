import 'dart:async';
import 'package:flutter_bloc_pattern_example/src/models/secret/secret_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/movies_response.dart';
import 'package:flutter/services.dart' show rootBundle;

// The provider is in charge of the communication between our app and the web service.
class MoviesApiProvider {
  Client client = Client();
  final _endpoint = 'http://api.themoviedb.org/3/movie/popular?api_key=';
  final _error = 'Failed to load post';
  final _pageParam = '&page=';
  var _pageValue = 1;

  /* A Future is an object representing a delayed computation. Is used to
  represent a potential value, or error, that will be available at some time
  in the future. Just like javascript Promises*/
  Future<MoviesResponse> fetchMovieList() async {
    String secretsJson = await rootBundle.loadString('assets/secrets.json');
    String apiKey = SecretModel.fromJson(json.decode(secretsJson)).apiKey;
    final response = await client.get('$_endpoint$apiKey$_pageParam$_pageValue');
    if (response.statusCode == 200) {
      MoviesResponse moviesResponse = MoviesResponse.fromJson(json.decode(response.body));
      _pageValue = moviesResponse.page + 1;
      return moviesResponse;
    } else {
      throw Exception(_error);
    }
  }
}