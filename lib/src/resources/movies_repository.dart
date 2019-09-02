import 'dart:async';
import 'movies_api_provider.dart';
import '../models/movies_response.dart';

/* This Repository class is the central point from where the data will flow to
the BLoC. It can be used both to communicate with a web service through a
provider, and to communicate with a database through a DAO object.*/
class MoviesRepository {
  final moviesApiProvider = MoviesApiProvider();

  Future<MoviesResponse> fetchAllMovies() => moviesApiProvider.fetchMovieList();
}