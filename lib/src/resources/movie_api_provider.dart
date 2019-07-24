import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';
import '../models/item_model.dart';

class MovieApiProvider {
  Client client = Client();
  final _endpoint = 'http://api.themoviedb.org/3/movie/popular?api_key=';
  final _apiKey = '7e6a9a3be4a61e50096bada46314ae9b';
  final _error = 'Failed to load post';

  Future<ItemModel> fetchMovieList() async {
    print("entered");
    final response = await client.get('$_endpoint$_apiKey');
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